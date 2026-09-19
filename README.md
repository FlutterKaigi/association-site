<div align="center">

<img src="web/images/logo.svg" alt="" width="96" height="96">

# 一般社団法人FlutterKaigi

**FlutterKaigi Association**

日本の Flutter コミュニティを支え、カンファレンスを継続的に開催するための法人です。<br>
このリポジトリは、その公式サイトのソースコードです。

**[association.flutterkaigi.jp →](https://association.flutterkaigi.jp)**

<br>

[![Deploy](https://github.com/FlutterKaigi/association-site/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/FlutterKaigi/association-site/actions/workflows/gh-pages.yml)
[![Dart](https://img.shields.io/badge/Dart-%5E3.10.0-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Jaspr](https://img.shields.io/badge/Jaspr-0.22.4-1A6DFF)](https://jaspr.site)
[![Static site](https://img.shields.io/badge/mode-static-6B7280)](https://docs.jaspr.site/get_started/modes)

</div>

<br>

## サイトに載っている内容

| セクション | 内容 |
| --- | --- |
| 法人概要 | 名称、主たる事務所、定款第 3 条（目的）、公告の方法 |
| 電子公告 | 各年度の貸借対照表 |
| 特定商取引法に基づく表記 | 事業者、代表者、販売価格、返品・返金など |
| ドキュメントとコミュニティ | 行動規範やプライバシーポリシー、各種アカウント |
| お問い合わせ | Google フォームへの導線 |

## 技術スタック

[Jaspr](https://jaspr.site) で書いた Dart の Web アプリを、**静的サイト**（`mode: static`）として
プリレンダリングしています。ブラウザに配るのは HTML と CSS が中心で、JavaScript が必要なのは
ヘッダーのハンバーガーメニューだけです。スタイルは Jaspr の `@css` で各コンポーネントが持ち、
CSS ファイルを手で書くことはありません。

```
lib/
├── app.dart                  ルート。ヘッダー + ルーター + フッターと、グローバルなスタイル
├── styles.dart               DesignTokens と Typography
├── main.server.dart          プリレンダ時のエントリ。メタ情報、フォント、リセット CSS
├── main.client.dart          クライアント側のエントリ
├── components/               再利用する UI
├── pages/                    ルートに対応するページ
└── constants/                色・リンク・法人情報などのデータ
```

`lib/main.server.options.dart` と `lib/main.client.options.dart` は
[jaspr_builder](https://pub.dev/packages/jaspr_builder) の生成物です。手で編集せず、
`@css` や `@client` を付けたクラスを増減させたときは再生成してコミットしてください。

## ローカルで動かす

```bash
make setup      # jaspr_cli のインストールと依存関係の解決
jaspr serve     # http://localhost:8080 で開発サーバを起動
```

変更を保存すると自動で反映されます。ビルドと静的ファイルの生成は次のとおりです。

```bash
make build      # build/jaspr/ に静的サイトを出力
make clean      # ビルドディレクトリの削除
```

コードを触ったら、コミット前に次の 2 つを通してください。

```bash
dart analyze                                        # jaspr_lints を含む
dart format --output=none --set-exit-if-changed lib # 120 桁
```

## デプロイ

`main` ブランチへの push をトリガーに、GitHub Actions が `jaspr build` を実行して
`gh-pages` ブランチへ公開します（[gh-pages.yml](.github/workflows/gh-pages.yml)）。
独自ドメイン `association.flutterkaigi.jp` はワークフローの `cname` が設定します。

Cloudflare Pages へ手動で配信する経路も `make deploy` に残しています。

## お問い合わせ

サイトの内容や当法人へのお問い合わせは
[お問い合わせフォーム](https://association.flutterkaigi.jp/#contact) からお願いします。
このリポジトリの不具合は Issue や Pull Request でも受け付けています。
