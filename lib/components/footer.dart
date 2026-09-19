import 'package:associate_site/constants/documents.dart';
import 'package:associate_site/constants/links.dart';
import 'package:associate_site/constants/organization.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// サイトフッター。
class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-inner', [
        div(classes: 'footer-top', [
          div(classes: 'footer-brand', [
            p(classes: 'footer-name', [Component.text(orgName)]),
            p(classes: 'footer-address', [Component.text(orgAddress)]),
          ]),
          div(classes: 'footer-nav', [
            _column('Conferences', conferenceLinks),
            _column('Documents', documents),
            _column('Links', socialLinks),
          ]),
        ]),
        p(classes: 'footer-copyright', [Component.text('© $orgFoundedYear-${DateTime.now().year} $orgName')]),
      ]),
    ]);
  }

  Component _column(String title, List<LinkItem> items) => nav(classes: 'footer-column', [
    p(classes: 'footer-column-title', [Component.text(title)]),
    for (final item in items) _link(item),
  ]);

  Component _link(LinkItem item) => a(
    href: item.href,
    target: Target.blank,
    attributes: const {'rel': 'noopener noreferrer'},
    [Component.text(item.label)],
  );

  @css
  static List<StyleRule> get styles => [
    css('.site-footer', [
      css('&').styles(
        padding: Padding.symmetric(vertical: 80.px, horizontal: 0.px),
        border: const Border.only(top: DesignTokens.hairline),
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
        fontSize: Typography.body,
        fontWeight: FontWeight.w700,
      ),
      css('.footer-address').styles(
        margin: Margin.only(top: 8.px),
        color: DesignTokens.inkMuted,
        fontSize: Typography.caption,
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
          // 列見出し。eyebrow より一段小さく、フッターの中でだけ使う。
          fontSize: 0.65.rem,
          fontWeight: FontWeight.w600,
          textTransform: TextTransform.upperCase,
          letterSpacing: Typography.trackingLabel,
        ),
        css('a').styles(
          transition: const Transition('color', duration: DesignTokens.motion),
          color: DesignTokens.ink,
          fontSize: Typography.bodyXs,
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
