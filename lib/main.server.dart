/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

const _title = '一般社団法人FlutterKaigi | FlutterKaigi Association';
const _description = '一般社団法人FlutterKaigiの法人概要、電子公告、特定商取引法に基づく表記、および各種ドキュメントをご案内します。';

/// 公開先。OG のクローラは相対パスを解決しないので、絶対 URL を組み立てる。
const _siteUrl = 'https://association.flutterkaigi.jp/';

/// スクロールに入った要素をフェードインさせる。
///
/// `.js-reveal` を自分で付けてから観測を始めるので、JS が動かない環境では
/// 要素が隠れたままにならない。
const _revealScript = '''
(function () {
  var root = document.documentElement;
  if (!('IntersectionObserver' in window)) return;
  root.classList.add('js-reveal');
  var observe = function () {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('is-visible');
        io.unobserve(entry.target);
      });
    }, { rootMargin: '0px 0px -10% 0px' });
    document.querySelectorAll('[data-reveal]').forEach(function (el) { io.observe(el); });
  };
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', observe);
  } else {
    observe();
  }
})();
''';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(options: defaultServerOptions);

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(
    Document(
      title: _title,
      lang: 'ja',
      meta: const {
        'description': _description,
        'og:title': _title,
        'og:description': _description,
        'og:type': 'website',
        'og:url': _siteUrl,
        // 主要な OG クローラは SVG を描画しないので、差し替えるときは PNG を
        // 置くこと。パスは絶対 URL でなければ解決されない。
        'og:image': '${_siteUrl}images/logo.svg',
        'twitter:card': 'summary',
      },
      styles: [
        css.import(
          'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700'
          '&family=Noto+Sans+JP:wght@400;500;700&display=swap',
        ),
        css('*, *::before, *::after').styles(boxSizing: BoxSizing.borderBox),
        css('html').styles(
          raw: {
            'scroll-behavior': 'smooth',
            // sticky ヘッダーにアンカー先が潜らないようにする。
            'scroll-padding-top': '${DesignTokens.headerHeight + 24}px',
          },
        ),
        css('body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: Padding.zero,
          margin: Margin.zero,
          color: DesignTokens.ink,
          fontFamily: DesignTokens.fontSans,
          fontSize: 16.px,
          lineHeight: 1.8.em,
          backgroundColor: DesignTokens.background,
          raw: {
            // 日本語のツメ組み。
            'font-feature-settings': '"palt"',
            // 既定 (auto) だと「キ / ャンセル」のように小書き仮名が行頭に来る。
            'line-break': 'strict',
            'word-break': 'normal',
            '-webkit-font-smoothing': 'antialiased',
            'text-rendering': 'optimizeLegibility',
          },
        ),
        css('h1, h2, h3, p').styles(margin: Margin.zero),
        css('img, svg').styles(display: Display.block, maxWidth: 100.percent),
      ],
      head: const [
        link(rel: 'canonical', href: _siteUrl),
        script(content: _revealScript),
      ],
      body: const App(),
    ),
  );
}
