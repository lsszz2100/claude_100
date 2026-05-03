# 008. Windows에서 Claude Code 시작하기

난이도: 초급  
기준일: 2026년 05월 03일

## 핵심 개념

Windows에서 Claude Code를 사용할 때는 PowerShell, CMD, Git Bash, WSL의 차이를 이해하면 시행착오가 줄어듭니다. 초급자는 하나의 환경을 정해 꾸준히 쓰는 것이 좋습니다. 이 책에서는 기본적으로 PowerShell을 기준으로 설명하되, 프로젝트에 따라 Git Bash나 WSL을 사용할 수 있음을 염두에 둡니다.

## PowerShell 기준 시작 순서

1. PowerShell을 엽니다.
2. 프로젝트 폴더로 이동합니다.
3. Claude Code를 실행합니다.

```powershell
cd "C:\path\to\your-project"
claude
```

경로에 공백이나 한글이 있으면 따옴표로 감싸는 것이 안전합니다.

```powershell
cd "C:\Users\me\OneDrive\바탕 화면\my-project"
```

## Git for Windows가 필요한 이유

Claude Code는 파일 탐색, Git 작업, 명령 실행을 자주 사용합니다. Windows에 Git for Windows가 설치되어 있으면 `git`, Bash 계열 도구, 일부 개발 명령을 더 자연스럽게 사용할 수 있습니다. 반드시 모든 프로젝트에서 필요한 것은 아니지만, 개발 작업을 할 계획이라면 설치해 두는 편이 좋습니다.

## WSL을 선택할 때

Node.js, Python, Docker, Linux 기반 도구를 많이 쓰는 프로젝트라면 WSL이 더 편할 수 있습니다. 하지만 WSL과 Windows 파일 경로가 섞이면 초급자에게 혼란스러울 수 있습니다. 처음에는 하나의 환경을 정하고 그 안에서 프로젝트를 관리하세요.

## 안전한 첫 요청

Windows에서 첫 실행을 했다면 바로 수정시키지 말고 읽기 전용 분석부터 시작하세요.

```text
이 프로젝트를 분석해줘.
아직 파일은 수정하지 마.
Windows 환경에서 실행할 때 필요한 명령과 주의사항을 함께 알려줘.
```

## 흔한 오류

### `irm`을 인식하지 못하는 경우

CMD에서 PowerShell 명령을 실행했을 가능성이 있습니다. PowerShell을 열고 다시 실행하세요.

### `&&` 구문 오류가 나는 경우

PowerShell에서 CMD용 명령을 실행했을 가능성이 있습니다. 현재 터미널 종류를 먼저 확인하세요.

### 경로를 찾지 못하는 경우

공백이나 한글이 포함된 경로를 따옴표 없이 입력했을 수 있습니다.

## Claude에게 입력할 프롬프트

```text
나는 Windows에서 Claude Code를 사용하려고 한다.
현재 프로젝트 경로는 다음과 같다.

[프로젝트 경로]

PowerShell 기준으로 다음을 알려줘.
1. 폴더 이동 명령
2. Claude Code 실행 명령
3. Git 상태 확인 명령
4. 테스트 명령을 찾는 방법
5. Windows에서 주의할 경로/쉘 문제
```

## 체크리스트

- [ ] PowerShell과 CMD를 구분할 수 있다.
- [ ] 공백이 있는 경로를 따옴표로 감쌀 수 있다.
- [ ] 프로젝트 폴더에서 `claude`를 실행할 수 있다.
- [ ] 첫 요청은 읽기 전용 분석으로 시작한다.

## 다음 단계

다음 장에서는 실제 첫 Claude Code 세션에서 어떤 요청을 해야 하는지 다룹니다.
