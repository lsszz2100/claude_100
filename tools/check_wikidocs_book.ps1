$ErrorActionPreference = "Stop"

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$root = Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")
$errors = New-Object System.Collections.Generic.List[string]

function Get-RelativePath([string]$Path) {
  $prefix = $root.Path.TrimEnd([char[]]@([char]92, [char]47)) + [System.IO.Path]::DirectorySeparatorChar
  if ($Path.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    return $Path.Substring($prefix.Length)
  }
  return $Path
}

function Remove-MarkdownCodeBlocks([string]$Text) {
  return [regex]::Replace(
    $Text,
    '(?ms)^```.*?^```',
    ""
  )
}

function Resolve-MarkdownTarget([string]$BaseDir, [string]$Target) {
  $parts = $Target -split '#'
  $clean = $parts[0]
  if ([string]::IsNullOrWhiteSpace($clean)) {
    return $null
  }
  return Join-Path $BaseDir $clean
}

$required = @("README.md", "TOC.md", "pages", "assets")
foreach ($item in $required) {
  $path = Join-Path $root.Path $item
  if (-not (Test-Path -LiteralPath $path)) {
    $errors.Add("Missing required item: $item")
  }
}

$markdownFiles = Get-ChildItem -LiteralPath $root.Path -Recurse -File -Filter "*.md"
foreach ($file in $markdownFiles) {
  $relativeFile = Get-RelativePath $file.FullName
  $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
  $body = Remove-MarkdownCodeBlocks $text
  $matches = [regex]::Matches($body, '(!?\[[^\]]*\]\(([^)]+)\))')

  foreach ($match in $matches) {
    $target = $match.Groups[2].Value.Trim()
    if ($target -match '^(https?:|mailto:|#)' -or [string]::IsNullOrWhiteSpace($target)) {
      continue
    }

    $resolved = Resolve-MarkdownTarget (Split-Path -Parent $file.FullName) $target
    if ($null -ne $resolved -and -not (Test-Path -LiteralPath $resolved)) {
      $errors.Add("Broken markdown target in ${relativeFile}: $target")
    }
  }
}

$tocPath = Join-Path $root.Path "TOC.md"
if (Test-Path -LiteralPath $tocPath) {
  $tocText = [System.IO.File]::ReadAllText($tocPath, [System.Text.Encoding]::UTF8)
  $tocBody = Remove-MarkdownCodeBlocks $tocText
  $tocMatches = [regex]::Matches($tocBody, '\[[^\]]+\]\((pages/[^)]+\.md)\)')
  foreach ($match in $tocMatches) {
    $target = Join-Path $root.Path $match.Groups[1].Value
    if (-not (Test-Path -LiteralPath $target)) {
      $errors.Add("TOC points to missing page: $($match.Groups[1].Value)")
    }
  }
}

$assetFiles = Get-ChildItem -LiteralPath (Join-Path $root.Path "assets") -File -ErrorAction SilentlyContinue
foreach ($asset in $assetFiles) {
  if ($asset.Extension -ieq ".png" -and $asset.Length -le 0) {
    $errors.Add("Empty image asset: $(Get-RelativePath $asset.FullName)")
  }
}

if ($errors.Count -gt 0) {
  Write-Host "WikiDocs book check failed:" -ForegroundColor Red
  foreach ($errorItem in $errors) {
    Write-Host "- $errorItem"
  }
  exit 1
}

Write-Host "WikiDocs book check passed."
Write-Host "Markdown files: $($markdownFiles.Count)"
Write-Host "Asset files: $($assetFiles.Count)"
