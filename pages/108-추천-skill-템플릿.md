# 108. 추천 Skill 템플릿

Skill은 반복 가능한 작업 절차를 패키징하는 단위입니다. 좋은 Skill은 언제 써야 하는지, 어떤 자료를 읽어야 하는지, 어떤 형식으로 결과를 내야 하는지를 짧게 정의합니다.

## SKILL.md 템플릿

````markdown
---
name: skill-name
description: Use when ...
---

# Skill Name

## When To Use

Use this skill when ...

## Inputs

- Required:
- Optional:

## Workflow

1. Read the relevant files.
2. Identify constraints and risks.
3. Produce the requested output.
4. Include verification steps.

## Output Format

```text
Summary:

Findings:

Recommended next steps:
```

## Guardrails

- Do not invent facts not present in the source.
- Do not edit files unless explicitly requested.
- Call out missing context.
````

## Claude에게 줄 요청

```text
내가 자주 하는 다음 작업을 Skill로 만들고 싶다.

작업:
[작업 설명]

요청:
1. Skill이 필요한 상황을 정의해줘.
2. SKILL.md 초안을 작성해줘.
3. 참조 파일, scripts, templates가 필요한지 구분해줘.
4. 너무 복잡하면 첫 버전에서 제외할 항목을 제안해줘.
```

## 체크리스트

- [ ] description이 호출 조건을 분명히 설명한다.
- [ ] workflow가 실제 작업 순서를 반영한다.
- [ ] 출력 형식이 재사용 가능하다.
- [ ] 자동 실행이나 쓰기 권한이 불필요하게 넓지 않다.
