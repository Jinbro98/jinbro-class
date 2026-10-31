# jinbro-class · 수업 실습 코치

리부팅랩 × jinbro 오프라인 수업 **"클로드코드 입문 + 마케팅 에이전트 만들기"**(2026-11-01)를 따라 하는 스킬입니다.
설치하고 `/jinbro-class`라고 치면, 클로드가 옆자리 코치처럼 실습을 순서대로 안내합니다.

- 지금 폴더와 만들어진 파일을 보고 어디까지 했는지 알려 주기
- 실습마다 직접 할 일(앱 버튼 · 새 세션 · 로그인)과 입력할 문장을 나눠 안내하기
- 끝나면 결과 파일을 읽고 완료 확인, 막히면 해결 방법이나 따라잡기 파일 제안
- 수업 개념 질문에 답하기 (`/jinbro-class 컨텍스트가 뭐예요?`)

Claude 데스크톱 앱의 Code 탭(또는 터미널 클로드코드)과 Claude Pro 이상 구독이 필요합니다.

## 설치 (git 필요 없음)

### 방법 1 · 클로드에게 설치 시키기 (추천)
데스크톱 앱 Code 탭에서 실습 폴더(바탕화면의 빈 폴더 `my-agent`)를 열고 입력창에:
```
https://github.com/Jinbro98/jinbro-class 의 README를 보고 수업 코치 스킬을 설치해 줘
```
설치 명령을 실행해도 되냐고 물으면 읽고 허용합니다. 끝나면 **새 세션**(+ New)을 열고 `/jinbro-class`.

### 방법 2 · 한 줄 명령 (터미널에 붙여 넣기)
맥 (터미널 앱) · 리눅스 · 윈도우 Git Bash:
```
curl -fsSL https://raw.githubusercontent.com/Jinbro98/jinbro-class/main/install.sh | bash
```
윈도우 (PowerShell):
```
irm https://raw.githubusercontent.com/Jinbro98/jinbro-class/main/install.ps1 | iex
```
`~/.claude/skills/jinbro-class`(윈도우는 `%USERPROFILE%\.claude\skills\jinbro-class`)에 설치되고, 이미 있으면 새 버전으로 바뀝니다.

### 클로드가 설치할 때 (Claude에게 주는 안내)
1. 운영체제와 쓸 수 있는 셸을 보고 위 **방법 2**의 명령 하나만 실행한다. 맥 · 리눅스 · Bash가 되는 윈도우는 `install.sh` 줄, PowerShell만 되는 윈도우는 `install.ps1` 줄
2. 명령이 막히면 같은 일을 직접 한다: 이 저장소의 `skills/jinbro-class` 폴더 전체를 `~/.claude/skills/jinbro-class`로 복사 (git이 없으면 `https://github.com/Jinbro98/jinbro-class/archive/refs/heads/main.zip`을 받아 풀기)
3. 끝나면 사용자에게 **새 세션**(+ New)을 열고 실습 폴더를 고른 뒤 `/jinbro-class`를 입력하라고 안내한다. 실습 자료는 코치를 처음 부를 때 그 폴더에 깔린다

### 방법 3 · 플러그인으로
입력창(또는 터미널 클로드코드)에 한 줄씩:
```
/plugin marketplace add Jinbro98/jinbro-class
/plugin install jinbro-class@jinbro-class
```
플러그인으로 설치하면 이름이 `/jinbro-class:jinbro-class`로 보입니다.

### 방법 4 · 직접 복사
이 페이지의 **Code → Download ZIP**으로 받아 압축을 풀고, `skills/jinbro-class` 폴더를 내 홈 폴더의 `.claude/skills/` 안에 넣습니다. (`.claude`는 숨김 폴더. 맥은 Cmd + Shift + .)

## 처음 부르면: 실습 자료 설치
코치를 처음 부르면 지금 폴더에 오전 실습 자료를 깝니다 (명령 허락 질문 한 번). 이미 있는 파일은 덮어쓰지 않습니다.
```
my-agent/
├─ 자료/                  아침결_소개서.md · 고객후기.md · 고객인터뷰.md (예시 제품 '아침결 그래놀라', 가상)
├─ 프롬프트팩.md          오늘 실습 문장 모음
├─ 실습안내.md            폴더 안내
├─ 수업코치/jinbro-class/ 코치 사본 (코치가 안내 파일을 여기서 읽음)
└─ .claude/settings.json  웹 검색 허용
```
직접 깔고 싶으면 실습 폴더에서 `bash ~/.claude/skills/jinbro-class/scripts/setup.sh` (윈도우 PowerShell은 `powershell -ExecutionPolicy Bypass -File $HOME\.claude\skills\jinbro-class\scripts\setup.ps1`).

## 쓰는 법
| 입력 | 하는 일 |
|---|---|
| `/jinbro-class` | 지금 어디까지 했는지 보고 다음 실습 추천 |
| `/jinbro-class 6` | 6번 실습부터 안내 (번호 = 수업 화면의 '실습 N' = 프롬프트 팩 번호) |
| `/jinbro-class 다음` | 다음 실습으로 |
| `/jinbro-class 막혔어요` | 막힌 곳 해결 |
| `/jinbro-class MCP가 뭐예요?` | 수업 개념 설명 |

## 들어 있는 것
```
skills/jinbro-class/
├─ SKILL.md                 코치의 역할 · 안내 순서 · 지키는 것
├─ references/
│  ├─ practices.md          실습 1~24 · 16-2 안내 (준비 · 직접 할 일 · 완료 확인 · 막히면)
│  ├─ prompt-pack.md        수업 프롬프트 팩 원문
│  ├─ concepts.md           수업 개념 설명
│  └─ app-guide.md          데스크톱 앱 버튼 지도 · 막힘 해결표
├─ scripts/                 실습 자료 설치 (setup.sh · setup.ps1)
└─ assets/
   ├─ practice/             실습 폴더에 까는 안내문 · 설정
   ├─ sample/               예시 제품 '아침결 그래놀라'(가상) 소개서 · 후기 · 인터뷰
   ├─ catchup/              오전 실습을 놓쳤을 때 쓰는 예시 결과 파일
   └─ catchup-pm/           오후 실습을 놓쳤을 때 쓰는 예시 결과 파일 (PROFILE.md · 전략 · 결정 기록 · 게시물)
```
저장소 안 파일 이름은 어떤 압축 프로그램으로 받아도 깨지지 않게 모두 영어로 두었습니다. 코치가 수강생 폴더에 복사할 때 한글 이름으로 바꿉니다.

### 오후 스타터 키트
마케팅 에이전트 스타터 키트(`marketing-agent`)는 [Releases](https://github.com/Jinbro98/jinbro-class/releases/latest)에 zip으로 올려 두었습니다: [marketing-agent-starter-kit.zip](https://github.com/Jinbro98/jinbro-class/releases/latest/download/marketing-agent-starter-kit.zip). 받아서 더블클릭으로 풀고 바탕화면에 두세요. 키트 안 `수업코치/`는 이 스킬 사본이라, 코치가 안내 파일을 허락 질문 없이 읽는 데 씁니다 (오전 실습 폴더도 같음).

## 실습 순서
오전 클로드코드 입문: 1 설치 · 2 첫 실행 · 3 수업 코치 설치 · 4 첫 업무 · 5 Plan 모드 · 6 컨텍스트 · 7 CLAUDE.md · 8 규칙 비교 · 9 내 첫 스킬 · 10 커넥터 · 11 플러그인 · 12 서브에이전트 · 13 오전 종합
오후 마케팅 에이전트: 14 스타터 키트 · 15 인터뷰 → PROFILE.md · 16 프로필 비교 · 16-2 copywriting 스킬 · 17 전략 · 18 콘텐츠 · 19 결정 기록 · 20 승인 관문 · 21 검색 점검 · 22 다음 날 · 23 지침 고치기 · 24 두 번째 제품

## 약속
- 코치는 게시 · 발송 · 광고 · 결제를 하지 않고, 비밀번호 · 토큰을 받지 않습니다
- 파일을 지우거나 덮어쓰기 전에 먼저 묻습니다
- 권한 모드는 Manual을 권합니다

## 라이선스
- 수업 자료(스킬 안내 · 프롬프트 팩 · 예시 자료)는 김진형(jinbro)의 저작물입니다. 수강생 개인 학습용으로 자유롭게 쓰세요
- 스타터 키트 zip 안 `.claude/skills/`의 마케팅 스킬 7개는 [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills)(MIT)에서 가져왔습니다. 라이선스 전문은 키트 안 `LICENSES/`

문의: 리부팅랩 카카오채널
