# 115. CI/CD 자동화 예시

CI/CD는 테스트, 빌드, 보안 검사, 배포를 반복 가능하게 만드는 장치입니다. Claude Code와 함께 사용할 때는 실패 로그를 읽고 원인을 좁히는 흐름까지 자동화할 수 있습니다.

## 기본 파이프라인

```text
checkout -> install -> lint -> test -> build -> security check -> deploy
```

## GitHub Actions 예시

```yaml
name: CI

on:
  pull_request:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - run: npm ci
      - run: npm run lint
      - run: npm test
      - run: npm run build
```

## Claude에게 줄 요청

```text
현재 프로젝트에 맞는 CI 파이프라인을 설계해줘.

확인할 것:
1. 패키지 매니저
2. lint 명령
3. test 명령
4. build 명령
5. 캐시 전략
6. 실패했을 때 읽어야 할 로그 위치

보안상 secret 출력 위험도 함께 검토해줘.
```

## 실패 로그 분석 요청

```text
아래 CI 로그를 분석해줘.

요청:
1. 최초 실패 원인
2. 파생 오류
3. 가장 작은 수정 후보
4. 재실행해야 할 명령
5. 관련 파일 후보

로그:
[붙여넣기]
```

## 체크리스트

- [ ] PR마다 테스트가 실행된다.
- [ ] main 배포 전 최소 검증이 있다.
- [ ] secret이 로그에 출력되지 않는다.
- [ ] 실패 원인을 추적할 수 있는 로그가 남는다.
