# 오후 따라잡기 파일

오후 실습(marketing-agent 스타터 키트)에서 앞 실습을 놓친 수강생이 다음 실습을 바로 해 볼 수 있게 쓰는 예시 결과물입니다. 예시 제품 '아침결 그래놀라'(가상) 기준이고, 제품 폴더 이름은 `achimgyeol`입니다.
내 제품으로 실습 중이라면 이 파일을 쓰지 말고, 코치가 앞 실습을 빠르게 대신 실행합니다 (인터뷰 답은 수강생이 합니다).
복사는 먼저 묻고, 이미 있는 파일을 덮어쓸 때는 한 번 더 묻습니다.

## 14번 따라잡기 · 오전 폴더(my-agent)가 없을 때
| 가져올 파일 | marketing-agent 안에 둘 이름 |
|---|---|
| `../sample/brochure.md` | `자료/아침결_소개서.md` |
| `../sample/reviews.md` | `자료/고객후기.md` |
| `../sample/interviews.md` | `자료/고객인터뷰.md` |
| `../catchup/customer-words.md` | `자료/고객의말.md` |
| `../catchup/competitors.md` | `자료/경쟁조사.md` |
| `../catchup/oneline-copy.SKILL.example.md` | `.claude/skills/oneline-copy/SKILL.md` (복사 뒤 '맥락 읽기'의 CLAUDE.md를 "지금 제품의 `products/<제품>/PROFILE.md`"로, 결과 저장 위치를 "`products/<제품>/output/<날짜-주제>/`"로 고친다) |
| `../catchup/CLAUDE.example.md`의 '3. 브랜드 말투' · '4. 마케팅 글 쓰는 법' · '6. 하지 말 것' 칸 | `CLAUDE.md` 맨 아래 '내 규칙' 칸. (예) 두 줄을 이 줄들로 바꾼다. 제품 맥락(15번 PROFILE.md로)과 결과물 규칙(키트 파일 지도가 우선)은 옮기지 않는다 |

## 15번 이후 따라잡기 · 예시 제품
순서대로 쌓입니다. 17을 따라잡으려면 15부터 복사합니다. 16 · 16-2는 뒤 실습의 준비물이 아니어서 따라잡기 파일이 없습니다 (PROFILE.md만 있으면 바로 해 볼 수 있습니다).

| 놓친 실습 | 할 일 |
|---|---|
| 15 인터뷰 | ① `products/_template/` 폴더를 통째로 `products/achimgyeol/`로 복사 ② `profile.md` → `products/achimgyeol/PROFILE.md` (견본을 덮어쓴다) ③ `docs/products.md` 표 맨 아래에 아래 '제품 목록 줄' 추가 |
| 17 전략 | `strategy.md` → `products/achimgyeol/strategy/첫달-성장전략.md` |
| 18 콘텐츠 | `post-instagram.md` → `products/achimgyeol/output/2026-11-02-3분아침/01_인스타피드.md` (예시 1개. 18번의 3개를 대신하지는 않는다) |
| 19 결정 기록 | `decisions.md` → `products/achimgyeol/decisions.md` (견본을 덮어쓴다) |
| 19-2 캠페인 팀원 | `campaign-planner.agent.example.md` → `.claude/agents/campaign-planner.md` (복사 뒤 새 세션에서 맡기기 문장만 직접) |

제품 목록 줄 (`(예) my-cafe` 줄은 그대로 둔다):
```
| achimgyeol | 아침결 그래놀라 | 우유만 부으면 3분, 대추로만 단맛 낸 아침 그래놀라 | 운영 중 |
```

복사한 뒤 한 줄로 알려 줍니다: "예시 결과를 넣었어요. 실습 화면처럼 보이지만 내가 만든 건 아니니, 시간이 나면 그 실습을 직접 해 보세요."
