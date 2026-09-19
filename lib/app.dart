import 'package:associate_site/components/footer.dart';
import 'package:associate_site/components/header.dart';
import 'package:associate_site/pages/corporate_info_page.dart';
import 'package:associate_site/pages/not_found_page.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      const Header(),
      Router(
        routes: [
          Route(path: '/', builder: (context, state) => const CorporateInfoPage()),
          // 拡張子付きのパスは build/jaspr/404.html にそのまま書き出される。
          // GitHub Pages / Cloudflare Pages はこれを未知の URL に対して返す。
          Route(path: '/404.html', builder: (context, state) => const NotFoundPage()),
        ],
        // クライアント側のルーティングで未知のパスに来たとき。
        errorBuilder: (context, state) => const NotFoundPage(),
      ),
      const SiteFooter(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // 内容が短いページ (404 など) でもフッターが画面下に来るようにする。
    css('.app-container').styles(
      display: Display.flex,
      minHeight: const Unit.expression('100svh'),
      flexDirection: FlexDirection.column,
    ),
    css('main').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      flex: const Flex(grow: 1),
    ),

    // JS が有効なときだけ隠してからフェードインさせる。スクリプトが動かなければ
    // `.js-reveal` が付かず、初期状態のまま普通に読める。
    css('html.js-reveal [data-reveal]').styles(
      opacity: 0,
      transition: const Transition.combine([
        Transition('opacity', duration: Duration(milliseconds: 600), curve: Curve.easeOut),
        Transition('transform', duration: Duration(milliseconds: 600), curve: Curve.easeOut),
      ]),
      transform: const Transform.translate(y: Unit.pixels(16)),
    ),
    css(
      'html.js-reveal [data-reveal].is-visible',
    ).styles(opacity: 1, transform: const Transform.translate(y: Unit.zero)),

    // リンクの末尾に置く矢印。hover でリンクの向きへ少し進む。
    //
    // ドキュメント一覧・緊急のお知らせ・404 の 3 つで共有する。色は「その矢印が
    // どの面に載るか」で変わるので各コンポーネント側で決め、ここでは動きだけを
    // 持つ。グローバルに置けるのは、jaspr_builder が lib/app.dart の CSS を
    // 最後に出力するため、各コンポーネントのルールより後に来ると保証できるから。
    css('.link-arrow').styles(
      transition: const Transition('transform', duration: DesignTokens.motion),
    ),
    css('a:hover .link-arrow').styles(transform: const Transform.translate(x: Unit.pixels(4))),
    // 「戻る」リンクだけ逆向き。
    css('a:hover .link-arrow-back').styles(transform: const Transform.translate(x: Unit.pixels(-4))),

    css.media(DesignTokens.reducedMotion, [
      css('html.js-reveal [data-reveal]').styles(
        opacity: 1,
        transform: Transform.none,
        raw: {'transition': 'none'},
      ),
      css('.link-arrow').styles(raw: {'transition': 'none'}),
    ]),

    css('::selection').styles(color: DesignTokens.background, backgroundColor: DesignTokens.accent),
  ];
}
