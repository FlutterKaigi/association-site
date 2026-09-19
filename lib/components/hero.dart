import 'package:associate_site/components/emergency_notice.dart';
import 'package:associate_site/components/grid_backdrop.dart';
import 'package:associate_site/components/hero_slideshow.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// ページ冒頭の大見出し。
class Hero extends StatelessComponent {
  const Hero({this.notice, super.key});

  /// 大見出しの上に出す緊急のお知らせ。`null` なら何も出さない。
  final EmergencyNotice? notice;

  @override
  Component build(BuildContext context) {
    return section(id: 'top', classes: 'hero', [
      const HeroSlideshow(),
      const GridBackdrop(),
      div(classes: 'hero-inner', [
        p(classes: 'hero-eyebrow', [Component.text('FlutterKaigi Association')]),
        h1(classes: 'hero-title', [
          span([Component.text('FlutterKaigi')]),
          span([Component.text('Association')]),
        ]),
        div(classes: 'hero-rule', []),
        p(classes: 'hero-lead', [
          Component.text('一般社団法人FlutterKaigi'),
          br(),
          Component.text('日本の Flutter コミュニティを支え、カンファレンスを継続的に開催するための法人です。'),
        ]),
        if (notice case final notice?) EmergencyNoticeBanner(notice),
      ]),
      div(classes: 'hero-scroll', [
        span([Component.text('Scroll')]),
        div(classes: 'hero-scroll-line', []),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero', [
      css('&').styles(
        display: Display.flex,
        position: Position.relative(),
        minHeight: const Unit.expression('calc(100svh - ${DesignTokens.headerHeight}px)'),
        padding: Padding.symmetric(vertical: 96.px, horizontal: DesignTokens.gutter.px),
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        backgroundColor: DesignTokens.background,
      ),
      css('.hero-inner').styles(
        position: Position.relative(),
        zIndex: const ZIndex(1),
        width: 100.percent,
        maxWidth: DesignTokens.containerWidth.px,
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
      css('.hero-eyebrow').styles(
        margin: Margin.only(bottom: 24.px),
        // 写真の上に小さく載るので、[DesignTokens.accent] より濃い方を使う。
        color: DesignTokens.accentHover,
        fontSize: 0.75.rem,
        fontWeight: FontWeight.w600,
        textTransform: TextTransform.upperCase,
        raw: {'letter-spacing': '0.18em'},
      ),
      css('.hero-title', [
        css('&').styles(
          display: Display.flex,
          margin: Margin.zero,
          flexDirection: FlexDirection.column,
          color: DesignTokens.ink,
          fontWeight: FontWeight.w700,
          raw: {'font-size': 'clamp(2.75rem, 9vw, 6.5rem)', 'line-height': '1.02', 'letter-spacing': '-0.035em'},
        ),
        css('span:last-child').styles(color: DesignTokens.inkMuted),
      ]),
      css('.hero-rule').styles(
        width: 64.px,
        height: 2.px,
        margin: Margin.symmetric(vertical: 40.px),
        backgroundColor: DesignTokens.accent,
      ),
      css('.hero-lead').styles(
        maxWidth: 46.rem,
        margin: Margin.zero,
        color: DesignTokens.heroInkMuted,
        fontSize: 1.rem,
        lineHeight: 2.em,
      ),
      css('.hero-scroll', [
        css('&').styles(
          display: Display.flex,
          position: Position.absolute(bottom: 32.px, right: DesignTokens.gutter.px),
          zIndex: const ZIndex(1),
          flexDirection: FlexDirection.column,
          alignItems: AlignItems.center,
          gap: Gap.all(12.px),
          color: DesignTokens.inkMuted,
          fontSize: 0.7.rem,
          textTransform: TextTransform.upperCase,
          raw: {'letter-spacing': '0.18em'},
        ),
        css('.hero-scroll-line').styles(
          width: 1.px,
          height: 56.px,
          animation: const Animation(
            name: 'hero-scroll-hint',
            duration: Duration(milliseconds: 1800),
          ),
          backgroundColor: DesignTokens.border,
          // Jaspr 0.22.4 の [Animation.count] は `infinity` という無効な値を
          // 書き出してしまい、指定ごとアニメーションが無視される。
          raw: {'animation-iteration-count': 'infinite', 'transform-origin': 'top'},
        ),
      ]),
    ]),

    css.keyframes('hero-scroll-hint', const {
      '0%': Styles(backgroundColor: DesignTokens.accent, raw: {'transform': 'scaleY(0)'}),
      '50%': Styles(backgroundColor: DesignTokens.accent, raw: {'transform': 'scaleY(1)'}),
      '100%': Styles(backgroundColor: DesignTokens.border, raw: {'transform': 'scaleY(0)'}),
    }),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.hero').styles(
        padding: Padding.symmetric(vertical: 64.px, horizontal: DesignTokens.gutterSm.px),
      ),
      css('.hero .hero-rule').styles(margin: Margin.symmetric(vertical: 28.px)),
      css('.hero .hero-scroll').styles(display: Display.none),
    ]),

    css.media(const MediaQuery.raw('(prefers-reduced-motion: reduce)'), [
      css('.hero .hero-scroll-line').styles(animation: Animation.none),
    ]),
  ];
}
