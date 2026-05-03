# 077. PostToolUse Hook

난이도: 고급  
기준일: 2026년 05월 03일

## 핵심 개념

`PostToolUse` Hook은 도구가 성공적으로 실행된 직후 호출됩니다. 파일 수정 후 포맷, 로그 기록, 변경 파일 검사처럼 “작업 후 처리”에 적합합니다.

`PreToolUse`가 막는 역할이라면, `PostToolUse`는 정리하고 검증하는 역할입니다.

## 사용 사례

- `.ts` 파일 수정 후 Prettier 실행
- `.go` 파일 수정 후 `gofmt` 실행
- 명령 실행 로그 기록
- 변경된 파일이 금지 패턴을 포함하는지 검사
- 테스트 파일 수정 후 관련 테스트 제안

## 설정 예시

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit",
        "hooks": [
          {
            "type": "command",
            "command": "python .claude/hooks/format_after_edit.py"
          }
        ]
      }
    ]
  }
}
```

## 포맷 스크립트 예시

```python
import json
import subprocess
import sys
from pathlib import Path

data = json.load(sys.stdin)
path = data.get("tool_input", {}).get("file_path")

if not path:
    sys.exit(0)

p = Path(path)

if p.suffix in [".ts", ".tsx", ".js", ".jsx"]:
    result = subprocess.run(
        ["npx", "prettier", "--write", str(p)],
        text=True,
        capture_output=True,
    )
    if result.returncode != 0:
        print(result.stderr, file=sys.stderr)
        sys.exit(2)

sys.exit(0)
```

`PostToolUse`에서 exit code `2`는 도구 실행 자체를 되돌리지는 않습니다. 이미 실행된 뒤이기 때문에 Claude에게 피드백을 제공해 후속 조치를 하게 만드는 의미입니다.

## 언제 쓰지 말아야 하나

- 시간이 오래 걸리는 전체 테스트 자동 실행
- 네트워크 배포 명령
- migration 실행
- 대량 파일 포맷
- secret을 읽는 검사

자동 실행 작업은 짧고 예측 가능해야 합니다.

## 체크리스트

- [ ] Hook 작업이 빠르고 결정적이다.
- [ ] 파일 확장자나 경로를 좁게 제한한다.
- [ ] 실패 메시지가 Claude에게 유용하다.
- [ ] 전체 테스트나 배포를 자동 실행하지 않는다.
- [ ] 포맷 변경과 의미 있는 변경이 섞이는 위험을 이해한다.

## 다음 단계

다음 장에서는 파일 수정 전에 민감 파일과 운영 파일을 차단하는 구체적 패턴을 다룹니다.
