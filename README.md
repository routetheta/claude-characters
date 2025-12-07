# claude-characters

Claude Code でキャラクターの口調を模倣するためのカスタムコマンド。

## セットアップ

```bash
cd ~/.claude
git submodule add git@github.com:routetheta/claude-characters.git characters
cd characters && ./setup.sh
```

### 別マシンでのクローン時

```bash
cd ~/.claude
git submodule update --init
cd characters && ./setup.sh
```

## 使い方

```bash
# ランダムにキャラクター選択
/character

# キャラクター指定
/character <キャラクター名>

# 一覧表示
/character list

# 新規登録
/character add <キャラクター名>

# 削除
/character remove <キャラクター名>

# モード解除
/character off
```

エイリアス `/char` も使用可能。
