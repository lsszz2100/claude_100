# 070. 테스트 Skill 만들기

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

테스트 Skill은 프로젝트마다 다른 테스트 명령, 실패 로그 읽기 방식, 최소 검증 기준을 재사용 가능하게 만듭니다. 다만 테스트 실행은 명령 실행 권한이 필요하므로 도구 권한을 신중히 설정해야 합니다.

## 폴더 구조

```text
.claude/
  skills/
    test-runner/
      SKILL.md
      references/
        test-strategy.md
```

## SKILL.md 예시

```markdown
---
name: Test Runner
description: Find and run the smallest relevant tests, analyze failures, and summarize verification results. Use after code changes, when tests fail, or when the user asks what tests to run.
allowed-tools: Read, Grep, Glob, Bash
---

# Test Runner

## Instructions

1. Identify the package manager and test commands from project files.
2. Prefer the smallest relevant test before running broad suites.
3. When tests fail, separate the first failing cause from cascading errors.
4. Never delete or weaken tests just to make them pass.
5. Summarize commands run and results.

## Safety

- Ask before running long or destructive commands.
- Do not run deployment, migration, or production commands.
- If the test command is unclear, stop and ask.

## Output Format

- Test command:
- Result:
- First failure:
- Likely cause:
- Suggested fix:
- Next verification:
```

`Bash`를 허용할 경우 너무 넓은 실행 권한이 될 수 있습니다. 팀 환경에서는 프로젝트 정책에 맞게 제한하거나, Skill 본문에 금지 명령을 명확히 적어야 합니다.

## 실패 로그 분석 규칙

테스트 Skill에는 다음 규칙이 있어야 합니다.

- 마지막 줄 요약만 보지 않는다.
- 최초 실패 지점을 찾는다.
- 테스트 작성 오류와 제품 코드 오류를 구분한다.
- flaky 가능성을 별도로 표시한다.
- 실행하지 못한 테스트는 이유를 남긴다.

## 체크리스트

- [ ] 테스트 명령을 실제 설정 파일에서 찾게 한다.
- [ ] 작은 관련 테스트 우선 원칙이 있다.
- [ ] 실패 로그 분석 기준이 있다.
- [ ] 금지 명령이 명확하다.
- [ ] 실행 결과 요약 형식이 고정되어 있다.

## 다음 단계

다음 장에서는 문서 생성과 문서 검토를 Skill로 만드는 방법을 다룹니다.
