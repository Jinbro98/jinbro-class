#!/usr/bin/env bash
# 수업 코치 jinbro-class 설치 (맥 · 리눅스 · 윈도우 Git Bash). git이 없어도 된다.
#   curl -fsSL https://raw.githubusercontent.com/Jinbro98/jinbro-class/main/install.sh | bash
# 설치 위치: ~/.claude/skills/jinbro-class (이미 있으면 새 버전으로 바꾼다)
set -euo pipefail

REPO="Jinbro98/jinbro-class"
BRANCH="${JINBRO_CLASS_BRANCH:-main}"
DEST="${JINBRO_CLASS_DEST:-${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/jinbro-class}"

TMP="$(mktemp -d 2>/dev/null || mktemp -d -t jinbro-class)"
trap 'rm -rf "$TMP"' EXIT

echo "수업 코치를 내려받는 중..."
curl -fsSL "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" | tar -xzf - -C "$TMP"
SRC="$(find "$TMP" -maxdepth 3 -type d -name jinbro-class -path '*/skills/*' | head -n 1)"
if [ -z "$SRC" ] || [ ! -f "$SRC/SKILL.md" ]; then
  echo "내려받기에 실패했어요. 인터넷 연결을 확인하고 다시 실행해 주세요." >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
cp -R "$SRC" "$DEST"

echo "설치 완료: $DEST"
echo "다음: Claude 앱 Code 탭에서 새 세션(+ New)을 열고 /jinbro-class 를 입력하세요."
