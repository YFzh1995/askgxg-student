#!/usr/bin/env bash
#
# AskGXG-student 技能安装脚本
#
# 用法：
#   curl -fsSL https://raw.githubusercontent.com/YFzh1995/askgxg-student/main/install.sh | bash
#
# 自定义安装位置（例如 opencode）：
#   SKILLS_DIR=~/.config/opencode/skills \
#     curl -fsSL https://raw.githubusercontent.com/YFzh1995/askgxg-student/main/install.sh | bash
#
set -euo pipefail

REPO="YFzh1995/askgxg-student"
BRANCH="main"
DEST="${SKILLS_DIR:-$HOME/.workbuddy/skills}"

say() { printf '  %s\n' "$*"; }

echo ""
echo "AskGXG-student 技能安装"
echo "  来源: $REPO"
echo "  位置: $DEST"
echo ""

if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
  echo "  错误：需要 curl 或 wget。"
  exit 1
fi

dl() {
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$1" -o "$2"
  else
    wget -qO "$2" "$1"
  fi
}

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

say "下载中…"
dl "https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz" "$TMP/pkg.tar.gz"

say "解压中…"
mkdir -p "$TMP/pkg"
tar -xzf "$TMP/pkg.tar.gz" -C "$TMP/pkg" --strip-components=1

if [ ! -d "$TMP/pkg/skills" ]; then
  echo "  错误：包内没有找到 skills/ 目录。"
  exit 1
fi

mkdir -p "$DEST"

# 一律复制，不建软链——WorkBuddy 的技能扫描不跟随目录软链
installed=0
for src in "$TMP/pkg/skills"/*/; do
  [ -d "$src" ] || continue
  name="$(basename "$src")"
  rm -rf "$DEST/$name"
  mkdir -p "$DEST/$name"
  cp -R "$src". "$DEST/$name/"
  say "已安装 $name"
  installed=$((installed + 1))
done

echo ""
if [ "$installed" -eq 0 ]; then
  echo "  没有安装任何技能，请把上面的输出发给我们。"
  exit 1
fi

echo "  完成，共 $installed 个。重启工作环境后生效。"
echo ""
