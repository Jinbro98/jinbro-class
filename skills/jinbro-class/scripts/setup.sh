#!/usr/bin/env bash
# 오전 실습 자료를 실습 폴더에 깐다 (맥 · 리눅스 · 윈도우 Git Bash).
#   bash <이 스킬 폴더>/scripts/setup.sh [대상 폴더, 기본은 지금 폴더]
# 이미 있는 파일은 덮어쓰지 않는다. 수업코치/jinbro-class 사본만 새 버전으로 바꾼다.
set -euo pipefail

S="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
T="${1:-$PWD}"
mkdir -p "$T"
cd "$T"
T="$(pwd -P)"

put() {
  if [ -e "$2" ]; then echo "그대로 둠 (이미 있음): $2"
  else cp "$1" "$2"; echo "만듦: $2"; fi
}

mkdir -p "자료" ".claude"
put "$S/assets/sample/brochure.md"     "자료/아침결_소개서.md"
put "$S/assets/sample/reviews.md"      "자료/고객후기.md"
put "$S/assets/sample/interviews.md"   "자료/고객인터뷰.md"
put "$S/references/prompt-pack.md"     "프롬프트팩.md"
put "$S/assets/practice/README.md"     "실습안내.md"
put "$S/assets/practice/settings.json" ".claude/settings.json"

COACH="$T/수업코치/jinbro-class"
if [ "$S" != "$COACH" ]; then
  mkdir -p "$T/수업코치"
  rm -rf "$COACH"
  cp -R "$S" "$COACH"
  echo "만듦: 수업코치/jinbro-class (코치 안내 파일 사본)"
fi

echo "완료: $T 에 오전 실습 자료를 깔았어요."
