# 069. 코드 리뷰 Skill 만들기

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

코드 리뷰 Skill은 반복되는 리뷰 기준을 팀 표준으로 고정하는 데 유용합니다. 리뷰는 칭찬보다 버그, 회귀, 보안, 테스트 공백을 우선해야 합니다.

읽기 전용 리뷰 Skill이라면 `allowed-tools: Read, Grep, Glob`로 제한하는 것이 좋습니다.

## 폴더 구조

```text
.claude/
  skills/
    code-reviewer/
      SKILL.md
      references/
        severity.md
```

## SKILL.md 예시

```markdown
---
name: Code Reviewer
description: Review code diffs and pull request changes for bugs, regressions, security risks, and missing tests. Use when the user asks for code review, PR review, diff review, or pre-merge risk analysis.
allowed-tools: Read, Grep, Glob
---

# Code Reviewer

## Instructions

1. Lead with findings ordered by severity.
2. Focus on bugs, regressions, security, and missing tests.
3. Include file and line references when possible.
4. Avoid style-only comments unless they hide a real risk.
5. If no major issues are found, say so clearly.

## Severity

- Critical: likely data loss, security breach, or production outage.
- High: likely user-facing bug or serious regression.
- Medium: plausible bug, missing validation, or important test gap.
- Low: maintainability issue with limited immediate impact.

## Output Format

## Findings

- Severity:
- File/Line:
- Problem:
- Why it matters:
- Suggested fix:

## Test Gaps

- [missing test]

## Open Questions

- [question]
```

## 테스트 프롬프트

Skill을 만든 뒤에는 실제 요청으로 동작을 확인합니다.

```text
현재 git diff를 코드 리뷰해줘.
버그, 회귀, 보안, 테스트 공백을 우선해줘.
```

Claude가 Skill을 사용하지 않는다면 `description`이 너무 모호한지 확인합니다.

## 체크리스트

- [ ] review 대상과 사용 시점이 description에 들어 있다.
- [ ] findings first 형식이 명확하다.
- [ ] severity 기준이 있다.
- [ ] 읽기 전용 도구만 허용한다.
- [ ] 스타일 리뷰보다 버그와 회귀를 우선한다.

## 다음 단계

다음 장에서는 테스트 실행과 실패 분석을 Skill로 만드는 방법을 다룹니다.
