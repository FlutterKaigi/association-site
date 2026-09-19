import 'package:associate_site/components/icons.dart';
import 'package:associate_site/components/link.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// お問い合わせフォームへ誘導するパネル。
///
/// 電話や個別のメールアドレスは公開していないため、窓口はこのフォーム 1 本に絞る。
class ContactCta extends StatelessComponent {
  const ContactCta({required this.href, super.key});

  /// お問い合わせフォームの URL。
  final String href;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'contact',
      attributes: const {'data-reveal': ''},
      [
        div(classes: 'contact-text', [
          p(classes: 'contact-lead', [
            Component.text(
              '当法人および FlutterKaigi に関するお問い合わせは、お問い合わせフォームより承ります。'
              '内容を確認のうえ、担当者よりご返信いたします。',
            ),
          ]),
          p(classes: 'contact-note', [
            Component.text('※お電話でのお問い合わせは承っておりません。'),
          ]),
        ]),
        linkTo(
          href: href,
          classes: 'contact-button',
          [
            span([Component.text('お問い合わせフォームを開く')]),
            Icons.arrowUpRight,
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.contact', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.all(40.px),
        border: DesignTokens.hairlineBox,
        radius: BorderRadius.circular(DesignTokens.radius.px),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        gap: Gap.all(32.px),
        // 05 は tinted でない帯なので、白地に白のカードでは沈む。下地は surface。
        backgroundColor: DesignTokens.surface,
      ),
      css('.contact-lead').styles(
        maxWidth: 40.rem,
        margin: Margin.zero,
        color: DesignTokens.ink,
        fontSize: Typography.body,
        lineHeight: 1.9.em,
      ),
      css('.contact-note').styles(
        margin: Margin.only(top: 12.px),
        color: DesignTokens.inkMuted,
        fontSize: Typography.caption,
        lineHeight: 1.8.em,
      ),
      css('.contact-button', [
        css('&').styles(
          display: Display.flex,
          padding: Padding.symmetric(vertical: 16.px, horizontal: 28.px),
          border: const Border.all(color: DesignTokens.accent, width: Unit.pixels(1)),
          radius: BorderRadius.circular(DesignTokens.radius.px),
          transition: const Transition.combine([
            Transition('border-color', duration: DesignTokens.motion),
            Transition('background-color', duration: DesignTokens.motion),
          ]),
          alignItems: AlignItems.center,
          gap: Gap.all(10.px),
          color: DesignTokens.background,
          fontSize: Typography.bodySm,
          fontWeight: FontWeight.w600,
          textDecoration: TextDecoration.none,
          whiteSpace: WhiteSpace.noWrap,
          backgroundColor: DesignTokens.accent,
        ),
        css('&:hover').styles(
          border: const Border.all(color: DesignTokens.accentHover, width: Unit.pixels(1)),
          backgroundColor: DesignTokens.accentHover,
        ),
      ]),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointMd.px), [
      css('.contact').styles(flexDirection: FlexDirection.column, alignItems: AlignItems.start, gap: Gap.all(28.px)),
      css('.contact .contact-button').styles(width: 100.percent, justifyContent: JustifyContent.center),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.contact').styles(padding: Padding.all(28.px)),
    ]),
  ];
}
