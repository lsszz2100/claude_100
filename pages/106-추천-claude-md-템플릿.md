# 106. 추천 CLAUDE.md 템플릿

`CLAUDE.md`는 Claude Code가 프로젝트를 이해할 때 참고하는 장기 지침입니다. 좋은 `CLAUDE.md`는 길지 않지만, 실행 명령과 금지사항, 검증 기준이 명확합니다.

## 템플릿

````markdown
# Project Instructions

## Project Overview

- 목적:
- 주요 사용자:
- 핵심 기능:

## Tech Stack

- Language:
- Framework:
- Package manager:
- Test:
- Build:

## Common Commands

```text
install:
dev:
test:
lint:
build:
```

## Working Rules

- 변경 전 관련 파일을 먼저 읽는다.
- 큰 변경은 계획을 먼저 제안한다.
- 테스트 없이 동작을 단정하지 않는다.
- 민감 정보, 토큰, 운영 설정은 출력하지 않는다.

## Code Style

- 기존 코드 스타일을 따른다.
- 불필요한 대규모 리팩터링을 피한다.
- 공개 API 변경 시 문서와 테스트를 함께 갱신한다.

## Done Criteria

- 관련 테스트를 실행했다.
- 실행하지 못한 검증은 이유를 남겼다.
- 변경 파일과 위험도를 요약했다.
````

## 작성 프롬프트

```text
현재 프로젝트를 읽고 CLAUDE.md 초안을 작성해줘.

포함할 것:
1. 프로젝트 목적
2. 기술 스택
3. 설치, 실행, 테스트, 빌드 명령
4. 코딩 규칙
5. 보안상 주의할 파일
6. 작업 완료 기준

추정한 내용은 "확인 필요"로 표시해줘.
```

## 좋은 기준

- [ ] 새 팀원이 읽어도 작업 방식이 이해된다.
- [ ] Claude Code가 실행할 명령이 명확하다.
- [ ] 금지사항이 구체적이다.
- [ ] 오래된 내용이 쌓이지 않게 관리 기준이 있다.
