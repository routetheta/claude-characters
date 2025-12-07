#!/bin/bash
# キャラクターモード初期化スクリプト
#
# 使用方法:
#   cd ~/.claude/characters && ./setup.sh
#
# このスクリプトは以下を行います:
# 1. ~/.claude/commands/character.md へのシンボリックリンク作成
# 2. ~/.claude/commands/char.md へのシンボリックリンク作成（エイリアス）

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="${SCRIPT_DIR%/characters}"
COMMANDS_DIR="$CLAUDE_DIR/commands"

echo "キャラクターモード セットアップ"
echo "================================"

# commands ディレクトリ確認
if [ ! -d "$COMMANDS_DIR" ]; then
    echo "エラー: $COMMANDS_DIR が見つかりません"
    exit 1
fi

TARGET_PATH="$SCRIPT_DIR/character.md"

# /character コマンド用シンボリックリンク
create_link() {
    local link_path="$1"

    if [ -L "$link_path" ]; then
        rm "$link_path"
    elif [ -f "$link_path" ]; then
        mv "$link_path" "${link_path}.bak"
        echo "既存ファイルをバックアップ: ${link_path}.bak"
    fi

    ln -s "$TARGET_PATH" "$link_path"
    echo "作成: $link_path"
}

create_link "$COMMANDS_DIR/character.md"
create_link "$COMMANDS_DIR/char.md"

echo ""
echo "セットアップ完了!"
echo "使用方法: /character または /char"
