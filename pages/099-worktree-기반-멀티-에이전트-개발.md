# 099. Worktree 기반 멀티 에이전트 개발

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

Git worktree는 하나의 저장소에서 여러 작업 디렉터리를 만들어 각기 다른 브랜치를 동시에 체크아웃하는 기능입니다. 멀티 에이전트 작업에서는 각 에이전트에게 별도 worktree를 주면 파일 충돌을 줄일 수 있습니다.

## 기본 명령

```text
git worktree add ../project-frontend feature/profile-ui
git worktree add ../project-backend feature/profile-api
git worktree list
```

작업이 끝나면 정리합니다.

```text
git worktree remove ../project-frontend
```

## 사용 시나리오

```text
project/
project-frontend/
project-backend/
project-docs/
```

각 worktree에서 Claude Code 세션을 따로 열고, 담당 범위를 분리합니다.

## 에이전트 지시 예시

```text
이 worktree는 frontend 작업 전용이다.

수정 가능:
- apps/web/**

수정 금지:
- services/api/**
- db/**
- infra/**

작업 후:
- 변경 파일
- 테스트 결과
- backend와 맞춰야 할 계약
을 요약해줘.
```

## 주의할 점

- 같은 브랜치를 두 worktree에서 동시에 쓰지 않는다.
- 공통 파일 변경은 먼저 합의한다.
- lockfile 변경은 충돌 가능성이 높다.
- 각 worktree의 의존성 설치 상태를 확인한다.
- 병합 전에 전체 테스트를 한 곳에서 다시 실행한다.

## 권장 폴더 전략

```text
project/              main integration worktree
project-ui/           feature/profile-ui
project-api/          feature/profile-api
project-docs/         docs/profile-update
```

루트 저장소를 통합용으로 남기고, 각 worktree에서 독립 작업을 진행하면 마지막 병합과 검증이 명확해집니다.

## 작업 시작 프롬프트

```text
이 worktree는 profile UI 전용 작업 공간이다.

목표:
- 프로필 수정 화면 구현

수정 가능:
- apps/web/src/features/profile/**

수정 금지:
- services/api/**
- db/**
- infra/**

공유 계약:
- API 응답 타입은 docs/profile-api-contract.md를 따른다.

작업 후 변경 파일, 테스트 결과, 계약 불일치 여부를 요약해줘.
```

## 병합 전 확인

```text
이 worktree의 변경사항을 main 통합 worktree에 병합하기 전에 검토해줘.

확인:
1. 변경 파일 목록
2. 공통 파일 변경 여부
3. lockfile 변경 여부
4. migration 변경 여부
5. 테스트 결과
6. 병합 후 실행할 통합 테스트
```

## 체크리스트

- [ ] worktree별 브랜치가 다르다.
- [ ] 에이전트별 수정 가능 경로가 명확하다.
- [ ] 공통 계약 변경은 먼저 합의한다.
- [ ] lockfile과 migration 충돌을 주의한다.
- [ ] 병합 후 통합 테스트를 실행한다.

## 다음 단계

다음 장에서는 Claude Code를 프로덕션 운영 전략 안에 배치하는 방법을 정리합니다.
