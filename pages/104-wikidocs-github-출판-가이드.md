# 104. WikiDocs GitHub 출판 가이드

WikiDocs용 원고를 GitHub로 관리하면 원고, 이미지, 목차, 수정 이력을 함께 다룰 수 있습니다. 핵심은 단순한 폴더 구조와 깨지지 않는 상대 경로입니다.

## 권장 구조

```text
README.md
TOC.md
pages/
  000-preface.md
  001-topic.md
assets/
  00-cover.png
  diagram.png
tools/
  generate_wikidocs_book.ps1
```

## 출판 전 점검

- [ ] `README.md`에 책 소개와 표지가 있다.
- [ ] `TOC.md`의 모든 링크가 실제 파일을 가리킨다.
- [ ] `pages/` 파일명은 번호 순서가 유지된다.
- [ ] 이미지 경로는 페이지 기준 상대 경로로 작성했다.
- [ ] 파일 인코딩은 UTF-8이다.
- [ ] 한 페이지에 너무 큰 이미지를 과하게 넣지 않았다.

## 이미지 경로 예시

페이지 파일이 `pages/001-topic.md`에 있고 이미지가 `assets/example.png`에 있으면 다음처럼 씁니다.

```markdown
\![설명](../assets/example.png)
```

README에서는 루트 기준으로 씁니다.

```markdown
\![표지](assets/00-cover.png)
```

## Claude에게 줄 검증 요청

```text
이 저장소를 WikiDocs 출판용으로 검토해줘.

확인할 것:
1. TOC.md 링크 누락
2. Markdown 이미지 경로 누락
3. 번호 순서와 파일명 불일치
4. README.md와 TOC.md의 역할 분리
5. 출판 전 보완할 점

파일은 수정하지 말고 먼저 검토 결과만 작성해줘.
```

## 운영 팁

큰 원고를 한 번에 고치기보다 장 단위로 수정하고, 목차 링크 검증을 반복하세요. 이미지 생성과 본문 수정은 별도 커밋으로 나누면 나중에 추적하기 쉽습니다.
