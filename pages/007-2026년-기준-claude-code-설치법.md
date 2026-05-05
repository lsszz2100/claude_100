# 007. 2026년 기준 Claude Code 설치법

난이도: 초급  
기준일: 2026년 05월 03일
저자: AI_Innovation_Studio

## 핵심 개념

Claude Code 설치법은 시간이 지나며 바뀝니다. 2026년 05월 03일 기준으로는 공식 문서를 우선해야 합니다. 과거 자료에는 `npm install -g @anthropic-ai/claude-code` 방식이 자주 등장하지만, 공식 안내에서는 npm 설치가 deprecated로 표시되어 있습니다. 따라서 설치 관련 정보는 오래된 블로그보다 공식 문서를 기준으로 판단해야 합니다.

## 공식 설치 흐름

Windows PowerShell에서는 다음 명령이 권장됩니다.

```powershell
irm https://claude.ai/install.ps1 | iex
```

WinGet을 사용할 수도 있습니다.

```powershell
winget install Anthropic.ClaudeCode
```

macOS, Linux, WSL에서는 다음 명령을 사용할 수 있습니다.

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Homebrew 환경에서는 다음 방식도 가능합니다.

```bash
brew install --cask claude-code
```

## 설치 후 첫 실행

프로젝트 폴더로 이동한 뒤 `claude`를 실행합니다.

```bash
cd your-project
claude
```

첫 실행 시 로그인 또는 인증 절차가 나타납니다. 이후 Claude Code는 현재 프로젝트를 기준으로 작업을 시작합니다.

## Windows에서 주의할 점

PowerShell과 CMD는 명령 문법이 다릅니다. PowerShell 프롬프트는 보통 `PS C:\...`처럼 보이고, CMD는 `C:\...`처럼 보입니다. PowerShell에서 CMD용 명령을 그대로 붙여넣으면 오류가 날 수 있습니다.

또한 native Windows 환경에서는 Git for Windows 설치가 권장됩니다. Git for Windows가 있으면 Claude Code가 Bash 도구를 더 자연스럽게 사용할 수 있습니다. WSL 환경이라면 Git for Windows가 필수는 아닙니다.

## 실습

아직 설치하지 않았다면, 먼저 공식 문서를 확인한 뒤 자신의 환경에 맞는 설치 명령을 하나만 선택하세요. 이미 설치했다면 다음 명령으로 상태를 확인합니다.

```bash
claude --version
```

또는 Claude Code 안에서 상태 명령을 확인합니다.

```text
/status
```

## Claude에게 입력할 프롬프트

```text
내 운영체제는 [Windows/macOS/Linux/WSL]이다.
2026년 기준 Claude Code를 설치하려고 한다.

다음을 확인해줘.
1. 내 환경에서 추천되는 설치 방식
2. 설치 전 확인할 것
3. 설치 후 확인 명령
4. 흔한 오류와 해결법
5. npm 설치 방식이 왜 권장되지 않는지
```

## 체크리스트

- [ ] 설치 정보는 공식 문서를 우선한다.
- [ ] Windows에서는 PowerShell과 CMD 명령을 구분한다.
- [ ] 설치 후 `claude` 실행을 확인한다.
- [ ] 오래된 npm 설치 가이드를 그대로 따르지 않는다.

## 다음 단계

다음 장에서는 Windows 사용자를 위한 Claude Code 시작 흐름을 더 자세히 다룹니다.
