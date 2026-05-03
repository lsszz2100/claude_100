# 114. Docker 배포 예시

Docker는 실행 환경을 고정해 로컬, CI, 운영의 차이를 줄이는 도구입니다. AI 앱에서는 환경 변수, 모델 API 키, 로그, 비용 설정을 이미지에 포함하지 않는 것이 중요합니다.

## Dockerfile 예시

```dockerfile
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

ENV NODE_ENV=production

CMD ["npm", "start"]
```

## .dockerignore 예시

```text
node_modules
.git
.env
.env.*
dist
coverage
*.log
```

## 배포 전 확인

- [ ] API 키가 이미지에 포함되지 않는다.
- [ ] `.env` 파일이 빌드 컨텍스트에 들어가지 않는다.
- [ ] health check 또는 readiness check가 있다.
- [ ] 로그에 프롬프트와 민감 정보가 그대로 남지 않는다.
- [ ] 이미지 크기와 빌드 시간이 과도하지 않다.

## Claude에게 줄 요청

```text
현재 프로젝트를 Docker로 배포하기 위한 계획을 작성해줘.

확인할 것:
1. 실행 명령
2. 필요한 환경 변수
3. Dockerfile 초안
4. .dockerignore 초안
5. 보안상 이미지에 포함하면 안 되는 파일
6. 로컬 검증 명령

아직 파일은 만들지 말고 계획만 작성해줘.
```

## 운영 팁

AI 앱은 코드만 배포하는 것이 아니라 프롬프트, 평가, 비용 제한, 모니터링까지 함께 운영해야 합니다. Dockerfile이 완성되어도 운영 준비가 끝난 것은 아닙니다.
