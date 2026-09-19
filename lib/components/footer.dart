import 'package:associate_site/constants/documents.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// サイトフッター。
class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  /// 過去に開催したカンファレンス。新しい回が先。
  ///
  /// 各回のサイトは `https://<年>.flutterkaigi.jp/` に置かれている。
  static const _eventYears = <int>[2026, 2025, 2024, 2023, 2022, 2021];

  static const _links = <(String, String)>[
    ('https://flutterkaigi.connpass.com/', 'connpass'),
    ('https://x.com/FlutterKaigi', 'X'),
    ('https://github.com/FlutterKaigi', 'GitHub'),
    ('https://medium.com/flutterkaigi', 'Medium'),
    ('https://www.youtube.com/@flutterkaigi', 'YouTube'),
  ];

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-inner', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            p(classes: 'footer-name', [Component.text('一般社団法人FlutterKaigi')]),
            p(classes: 'footer-address', [Component.text('東京都渋谷区渋谷2丁目19番15号宮益坂ビルディング609')]),
          ]),
          div(classes: 'footer-nav', [
            _column('Conferences', [
              for (final year in _eventYears) _link('https://$year.flutterkaigi.jp/', 'FlutterKaigi $year'),
            ]),
            _column('Documents', [
              for (final (label, href) in documents) _link(href, label),
            ]),
            _column('Links', [
              for (final (href, label) in _links) _link(href, label),
            ]),
          ]),
        ]),
        p(classes: 'footer-copyright', [Component.text('© 2021-2026 一般社団法人FlutterKaigi')]),
      ]),
    ]);
  }

  Component _column(String title, List<Component> children) => nav(classes: 'footer-column', [
    p(classes: 'footer-column-title', [Component.text(title)]),
    ...children,
  ]);

  Component _link(String href, String label) => a(
    href: href,
    target: Target.blank,
    attributes: const {'rel': 'noopener noreferrer'},
    [Component.text(label)],
  );

  @css
  static List<StyleRule> get styles => [
    css('.site-footer', [
      css('&').styles(
        padding: Padding.symmetric(vertical: 80.px, horizontal: 0.px),
        border: const Border.only(
          top: BorderSide.solid(color: DesignTokens.border, width: Unit.pixels(1)),
        ),
      ),
      css('.footer-inner').styles(
        maxWidth: DesignTokens.containerWidth.px,
        padding: Padding.symmetric(horizontal: DesignTokens.gutter.px),
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
      css('.footer-top').styles(
        display: Display.flex,
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.start,
        gap: Gap.all(48.px),
      ),
      css('.footer-name').styles(
        margin: Margin.zero,
        color: DesignTokens.ink,
        fontSize: 0.95.rem,
        fontWeight: FontWeight.w700,
      ),
      css('.footer-address').styles(
        margin: Margin.only(top: 8.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.8.rem,
      ),
      css('.footer-nav').styles(
        display: Display.flex,
        flexWrap: FlexWrap.wrap,
        gap: Gap.all(56.px),
      ),
      css('.footer-column', [
        css('&').styles(display: Display.flex, flexDirection: FlexDirection.column, gap: Gap.all(12.px)),
        css('.footer-column-title').styles(
          margin: Margin.only(bottom: 4.px),
          color: DesignTokens.inkMuted,
          fontSize: 0.65.rem,
          fontWeight: FontWeight.w600,
          textTransform: TextTransform.upperCase,
          raw: {'letter-spacing': '0.18em'},
        ),
        css('a').styles(
          transition: const Transition('color', duration: Duration(milliseconds: 200)),
          color: DesignTokens.ink,
          fontSize: 0.85.rem,
          fontWeight: FontWeight.w500,
          textDecoration: TextDecoration.none,
        ),
        css('a:hover').styles(color: DesignTokens.accent),
      ]),
      css('.footer-copyright').styles(
        margin: Margin.only(top: 64.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.75.rem,
      ),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointMd.px), [
      css('.site-footer .footer-top').styles(flexDirection: FlexDirection.column, gap: Gap.all(48.px)),
      css('.site-footer .footer-nav').styles(gap: Gap.all(48.px)),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.site-footer').styles(
        padding: Padding.symmetric(vertical: 56.px, horizontal: 0.px),
      ),
      css('.site-footer .footer-inner').styles(padding: Padding.symmetric(horizontal: DesignTokens.gutterSm.px)),
      css('.site-footer .footer-nav').styles(flexDirection: FlexDirection.column, gap: Gap.all(40.px)),
      css('.site-footer .footer-copyright').styles(margin: Margin.only(top: 48.px)),
    ]),
  ];
}
