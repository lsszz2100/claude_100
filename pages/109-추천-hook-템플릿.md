# 109. 추천 Hook 템플릿

Hook은 Claude Code의 특정 이벤트에 자동 실행되는 명령입니다. 자동 실행은 편리하지만 위험하므로, 처음에는 읽기 전용 검증이나 로그처럼 영향이 작은 용도로 시작하세요.

## 설계 원칙

- 자동 실행 범위를 작게 유지한다.
- 삭제, 배포, 외부 전송 같은 명령은 기본적으로 피한다.
- 입력값을 신뢰하지 말고 검증한다.
- 실패 메시지는 짧고 구체적으로 만든다.
- 팀원이 끌 수 있는 방법을 문서화한다.

## settings.json 예시

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "python .claude/hooks/check_format.py"
          }
        ]
      }
    ]
  }
}
```

## Hook 스크립트 기본 구조

```python
import json
import sys

def main():
    payload = json.load(sys.stdin)
    # Validate only. Avoid destructive actions.
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
```

## Claude에게 줄 요청

```text
다음 자동화 후보를 Claude Code Hook으로 만들지 검토해줘.

후보:
[설명]

검토 기준:
1. 자동 실행이 필요한가?
2. 수동 명령이나 Skill로 충분한가?
3. 권한과 보안 위험은 무엇인가?
4. 최소 권한 설계는 무엇인가?
```

## 체크리스트

- [ ] Hook이 꼭 필요한 자동화다.
- [ ] 실패해도 작업 파일을 망가뜨리지 않는다.
- [ ] 민감 정보가 로그에 남지 않는다.
- [ ] 팀에 비활성화 방법을 공유했다.
