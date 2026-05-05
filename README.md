# Claude 기초부터 고급까지 100

![Status](https://img.shields.io/badge/status-active-2f6f4e)
![License](https://img.shields.io/badge/license-MIT-4b5563)
![Format](https://img.shields.io/badge/format-WikiDocs-2563eb)
![Author](https://img.shields.io/badge/author-AI_Innovation_Studio-111827)

![Claude 기초부터 고급까지 100 표지](assets/00-cover.png)

Claude, Claude Code, MCP, Skills, Hooks, Subagents, Agent Teams, RAG, 평가, 배포, 운영까지 한 번에 연결하는 실전형 100선 원고입니다.

- 기준일: 2026년 05월 03일
- 저자: AI_Innovation_Studio
- 라이선스: MIT License
- 형식: WikiDocs 출판용 Markdown 원고
- 대상: Claude 입문자, 실무 개발자, 자동화 담당자, AI 제품 기획자, 팀 리더

## 바로 보기

- [전체 목차](TOC.md)
- [들어가며](pages/000-preface.md)
- [명령어 치트시트](pages/101-명령어-치트시트.md)
- [팀 도입 가이드](pages/118-팀-도입-가이드.md)
- [최종 프로젝트 10개](pages/120-최종-프로젝트-10개.md)

## 이 책에서 다루는 것

이 저장소는 Claude를 단순 대화 도구로 쓰는 단계를 넘어, 실제 프로젝트를 읽고 수정하고 검증하는 작업 흐름까지 다룹니다.

| 영역 | 내용 |
| --- | --- |
| Claude 입문 | Claude, Claude Code, Web, Desktop, CLI, IDE의 차이 |
| 프롬프트 기초 | 역할, 목표, 맥락, 제약, 결과 형식 지정 |
| Claude Code 실무 | 파일 읽기, 작은 수정, 테스트, Git 변경 검토 |
| 프로젝트 운영 | `CLAUDE.md`, PRD, progress 문서, 세션 관리 |
| 자동화 확장 | Skills, Hooks, MCP, Subagents, Agent Teams |
| 프로덕션 | 보안, CI/CD, Docker, 모니터링, 비용 최적화 |
| 부록 | 템플릿, 체크리스트, WikiDocs 출판 가이드 |

## 추천 학습 경로

처음 읽는다면 아래 순서를 권장합니다.

1. 001-010: Claude와 Claude Code 기본 개념
2. 011-020: 좋은 프롬프트의 구조
3. 021-030: Claude Code 기본 명령과 안전한 작업 습관
4. 031-037: 프로젝트 메모리와 장기 작업 관리
5. 038-055: 개발 업무별 프롬프트 패턴
6. 056-065: IDE, 원격 작업, 컨텍스트, 비용 관리
7. 066-100: Skills, Hooks, MCP, Subagents, 운영 전략
8. 101-120: 실무 템플릿, 체크리스트, 최종 프로젝트

개발 경험이 있다면 031번부터 시작해도 됩니다. 팀 도입이 목적이라면 083번 MCP, 092번 Subagents, 100번 운영 전략, 118번 팀 도입 가이드를 먼저 보는 것도 좋습니다.

## 저장소 구조

```text
README.md
TOC.md
pages/
assets/
tools/
LICENSE
```

| 경로 | 설명 |
| --- | --- |
| `README.md` | GitHub용 프로젝트 소개 |
| `TOC.md` | WikiDocs용 전체 목차 |
| `pages/` | 본문 원고 |
| `assets/` | 표지와 장별 이미지 |
| `tools/` | 원고 생성과 출판 전 검증 스크립트 |
| `LICENSE` | MIT License 전문 |

## 검증

커밋 전에는 다음 검증을 실행합니다.

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\check_wikidocs_book.ps1
```

검증 스크립트는 다음 항목을 확인합니다.

- 필수 파일과 폴더 존재 여부
- Markdown 링크와 이미지 경로
- 페이지 번호와 TOC 순서
- 빈 이미지 파일
- 허용 저자 표기
- 토큰, private key, secret assignment 패턴
- 커밋하면 안 되는 문서 확장자

## 라이선스

이 저장소는 [MIT License](LICENSE)를 따릅니다.

원고, 스크립트, 문서 자산을 사용할 때는 저장소의 `LICENSE` 파일에 포함된 조건을 확인하세요.
