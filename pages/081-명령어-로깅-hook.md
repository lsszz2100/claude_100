# 081. 명령어 로깅 Hook

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

명령어 로깅 Hook은 Claude Code가 실행하려는 Bash 명령이나 실행 후 결과를 기록하는 패턴입니다. 디버깅, 감사, 팀 운영 정책 확인에 유용하지만, 비밀정보를 로그에 남기지 않도록 주의해야 합니다.

## PreToolUse 로깅 예시

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "python .claude/hooks/log_bash.py"
          }
        ]
      }
    ]
  }
}
```

## 스크립트 예시

```python
import datetime
import json
import re
import sys

data = json.load(sys.stdin)
command = data.get("tool_input", {}).get("command", "")

redacted = re.sub(r"(API_KEY|TOKEN|PASSWORD|SECRET)=\\S+", r"\\1=[redacted]", command)

with open(".claude/command-log.ndjson", "a", encoding="utf-8") as f:
    f.write(json.dumps({
        "time": datetime.datetime.utcnow().isoformat() + "Z",
        "command": redacted,
    }, ensure_ascii=False) + "\\n")

sys.exit(0)
```

## 로그에 남기면 안 되는 것

- 실제 API 키
- 토큰
- 비밀번호
- 고객 개인정보
- 전체 `.env` 내용
- 민감한 경로와 내부 시스템 정보

로깅은 보안 도구가 될 수도 있고, 보안 사고 원인이 될 수도 있습니다.

## 운영 팁

- 로그 파일을 Git에 커밋하지 않는다.
- `.gitignore`에 `.claude/command-log.ndjson`를 추가한다.
- redaction 규칙을 테스트한다.
- 민감 명령은 로그 대신 차단하는 편이 나을 수 있다.

## 체크리스트

- [ ] 로그 목적이 명확하다.
- [ ] secret redaction이 있다.
- [ ] 로그 파일이 Git에 커밋되지 않는다.
- [ ] 개인정보와 고객 데이터를 남기지 않는다.
- [ ] 차단해야 할 명령과 기록만 할 명령을 구분한다.

## 다음 단계

다음 장에서는 Hooks를 설계할 때 반드시 고려해야 할 보안 원칙을 정리합니다.
