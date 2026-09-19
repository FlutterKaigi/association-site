import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// 存在しない URL に来たときのページ。
///
/// 静的ホスティングが拾えるよう `/404.html` として書き出すほか、
/// クライアント側のルーティングでも `Router.errorBuilder` から使う。
class NotFoundPage extends StatelessComponent {
  const NotFoundPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      const Document.head(
        title: '404 Not Found | 一般社団法人FlutterKaigi',
        meta: {'robots': 'noindex'},
      ),
      section(classes: 'not-found', [
        div(classes: 'not-found-inner', [
          p(classes: 'not-found-eyebrow', [Component.text('404 — Not Found')]),
          h1(classes: 'not-found-title', [Component.text('ページが見つかりませんでした')]),
          p(classes: 'not-found-lead', [
            Component.text('お探しのページは、URL が変更されたか削除された可能性があります。'),
          ]),
          a(href: '/', classes: 'not-found-action', [
            span(classes: 'not-found-action-arrow', [Component.text('←')]),
            span([Component.text('トップへ戻る')]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.not-found', [
      css('&').styles(
        display: Display.flex,
        // 画面高は占有しない。main が伸びた分の中で中央に置く。
        padding: Padding.symmetric(vertical: 80.px, horizontal: DesignTokens.gutter.px),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        flex: const Flex(grow: 1),
        backgroundColor: DesignTokens.background,
      ),
      // 内容が短いので中央寄せ。本文カラム幅 (1120px) だと間延びするため絞る。
      css('.not-found-inner').styles(
        width: 100.percent,
        maxWidth: 40.rem,
        margin: Margin.symmetric(horizontal: Unit.auto),
        textAlign: TextAlign.center,
      ),
      // 横罫線を引く「01 ── 法人概要」の書式は連番を表す記号なので使わない。
      // Hero やカードと同じ、ラベル用の eyebrow に寄せる。
      css('.not-found-eyebrow').styles(
        color: DesignTokens.accent,
        fontSize: 0.75.rem,
        fontWeight: FontWeight.w600,
        textTransform: TextTransform.upperCase,
        raw: {'letter-spacing': '0.18em'},
      ),
      css('.not-found-title').styles(
        margin: Margin.only(top: 20.px),
        color: DesignTokens.ink,
        fontSize: 1.75.rem,
        fontWeight: FontWeight.w700,
        raw: {'letter-spacing': '-0.01em'},
      ),
      css('.not-found-lead').styles(
        margin: Margin.only(top: 24.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.95.rem,
        lineHeight: 2.em,
      ),
      css('.not-found-action', [
        css('&').styles(
          display: Display.inlineFlex,
          padding: Padding.symmetric(vertical: 14.px, horizontal: 28.px),
          margin: Margin.only(top: 40.px),
          border: const Border.all(color: DesignTokens.border, width: Unit.pixels(1)),
          radius: BorderRadius.circular(DesignTokens.radius.px),
          transition: const Transition('all', duration: Duration(milliseconds: 200)),
          alignItems: AlignItems.center,
          gap: Gap.all(10.px),
          color: DesignTokens.ink,
          fontSize: 0.9.rem,
          fontWeight: FontWeight.w500,
          textDecoration: TextDecoration.none,
        ),
        css('&:hover').styles(
          border: const Border.all(color: DesignTokens.accent, width: Unit.pixels(1)),
          color: DesignTokens.accent,
        ),
        css('.not-found-action-arrow').styles(
          transition: const Transition('transform', duration: Duration(milliseconds: 200)),
          color: DesignTokens.inkMuted,
        ),
        css('&:hover .not-found-action-arrow').styles(
          transform: const Transform.translate(x: Unit.pixels(-4)),
          color: DesignTokens.accent,
        ),
      ]),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.not-found').styles(
        padding: Padding.symmetric(vertical: 64.px, horizontal: DesignTokens.gutterSm.px),
      ),
      css('.not-found .not-found-title').styles(fontSize: 1.25.rem),
    ]),
  ];
}
