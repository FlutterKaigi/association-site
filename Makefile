BUILD_DIR = build/jaspr
WRANGLER = npx wrangler

.PHONY: help build deploy clean setup

help:
	@echo "利用可能なコマンド:"
	@echo "  make setup   - jaspr_cli のインストールと依存関係の解決"
	@echo "  make build   - 静的サイトのビルド (target: static)"
	@echo "  make deploy  - Cloudflare Pages へのデプロイ"
	@echo "  make clean   - ビルドディレクトリの削除"

setup:
	dart pub global activate jaspr_cli
	dart pub get

build:
	@echo "Building Jaspr project..."
	jaspr build
	@# web フォルダから _redirects をコピー (Cloudflare Pages 用)
	@cp web/_redirects build/jaspr/_redirects || echo "Note: _redirects not found in web/"

deploy: build
	$(WRANGLER) pages deploy $(BUILD_DIR)

clean:
	rm -rf build/
