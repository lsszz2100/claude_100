# 105. 추천 .claude 폴더 구조

`.claude` 폴더는 프로젝트별 Claude Code 설정을 모아 두는 장소입니다. 모든 기능을 한 번에 넣기보다, 팀이 실제로 반복하는 작업부터 작게 추가하는 편이 안전합니다.

## 기본 구조

```text
.claude/
  settings.json
  skills/
    code-review/
      SKILL.md
  agents/
    reviewer.md
  hooks/
    format_after_edit.py
    block_sensitive_edits.py
  commands/
    legacy-command.md
```

## 무엇을 어디에 둘까

| 항목 | 용도 |
| --- | --- |
| `settings.json` | 권한, hooks, 기본 동작 설정 |
| `skills/` | 반복 가능한 작업 절차와 참조 자료 |
| `agents/` | 전문 역할을 가진 subagent 정의 |
| `hooks/` | 특정 이벤트에 자동 실행할 스크립트 |
| `commands/` | 기존 slash command 스타일 자산 |

## 최소 시작안

처음부터 복잡한 구조를 만들 필요는 없습니다.

```text
.claude/
  settings.json
  skills/
    review/
      SKILL.md
```

코드 리뷰, 테스트, 문서화 중 가장 자주 반복하는 하나만 Skill로 만들고 효과를 확인하세요.

## Claude에게 줄 요청

```text
현재 프로젝트에 맞는 .claude 폴더 구조를 제안해줘.

조건:
- 처음에는 최소 구조로 시작한다.
- hooks는 자동 실행 위험이 있으므로 꼭 필요한 경우만 제안한다.
- 각 파일의 목적과 포함할 내용을 설명한다.
- 실제 파일 생성은 아직 하지 말고 계획만 작성한다.
```

## 체크리스트

- [ ] 팀 규칙과 개인 취향이 섞이지 않았다.
- [ ] 자동 실행 hooks는 최소 권한으로 설계했다.
- [ ] Skills는 반복 작업에만 만들었다.
- [ ] 민감 정보나 토큰을 설정 파일에 저장하지 않았다.
