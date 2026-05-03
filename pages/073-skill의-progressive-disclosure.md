# 073. Skill의 progressive disclosure

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

progressive disclosure는 필요한 정보만 단계적으로 로드하는 설계 원칙입니다. Skill에서는 `description`이 항상 보이고, `SKILL.md` 본문은 Skill이 활성화될 때 읽히며, references/scripts/templates는 필요할 때만 사용됩니다.

이 구조 덕분에 긴 문서와 스크립트를 Skill에 포함해도 매번 전체 컨텍스트를 차지하지 않습니다.

## 세 단계

| 단계 | 내용 | 언제 로드되는가 |
| --- | --- | --- |
| Metadata | `name`, `description` | 항상 탐색에 사용 |
| SKILL.md body | 핵심 절차 | Skill 사용 시 |
| Supporting files | references, scripts, templates | 필요할 때 |

## 나쁜 설계

```text
SKILL.md 안에 다음을 전부 넣음:
- 회사 정책 전문
- API 문서 전체
- 예제 30개
- 스크립트 코드 전체
- 템플릿 전체
```

이렇게 하면 Skill이 활성화될 때 불필요한 내용까지 한꺼번에 들어옵니다.

## 좋은 설계

```text
deploy-skill/
  SKILL.md
  references/
    aws.md
    gcp.md
    rollback.md
  scripts/
    check_env.py
  templates/
    release-note.md
```

`SKILL.md`에는 선택 기준만 둡니다.

```markdown
## Provider Selection

- For AWS deployment review, read `references/aws.md`.
- For GCP deployment review, read `references/gcp.md`.
- For rollback planning, read `references/rollback.md`.
```

## 본문에 남길 것

- Skill의 목적
- 언제 사용할지
- 첫 단계
- 어떤 reference를 언제 읽을지
- 출력 형식
- 금지사항

## references로 분리할 것

- 긴 정책 문서
- API 상세 명세
- 프레임워크별 예시
- 회사별 템플릿
- 드문 edge case

## 체크리스트

- [ ] `SKILL.md`는 핵심 절차만 담는다.
- [ ] 긴 정보는 references로 분리한다.
- [ ] reference 파일을 언제 읽을지 명확히 적는다.
- [ ] 같은 내용을 본문과 reference에 중복하지 않는다.
- [ ] Skill이 너무 넓으면 여러 Skill로 나눈다.

## 다음 단계

다음 장에서는 쓸모없거나 위험한 Skill을 제거하는 기준을 다룹니다.
