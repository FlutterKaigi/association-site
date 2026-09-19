import 'package:associate_site/components/icons.dart';
import 'package:associate_site/constants/links.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// 電子公告の 1 行。年度ラベルと PDF へのゴーストボタンを左右に配置する。
class NoticeRow extends StatelessComponent {
  const NoticeRow({required this.item, super.key});

  final LinkItem item;

  @override
  Component build(BuildContext context) {
    return a(
      href: item.href,
      classes: 'notice-row',
      target: Target.blank,
      attributes: const {'rel': 'noopener noreferrer'},
      [
        span(classes: 'notice-label', [Component.text(item.label)]),
        span(classes: 'notice-action', [
          span([Component.text('PDF を開く')]),
          Icons.arrowUpRight,
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.notice-row', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 24.px),
        border: const Border.only(top: DesignTokens.hairline),
        transition: const Transition('border-color', duration: DesignTokens.motion),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        gap: Gap.all(16.px),
        color: DesignTokens.ink,
        textDecoration: TextDecoration.none,
      ),
      css('&:last-child').styles(
        border: const Border.symmetric(vertical: DesignTokens.hairline),
      ),
      css('.notice-label').styles(fontSize: 0.95.rem, fontWeight: FontWeight.w500),
      css('.notice-action').styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 10.px, horizontal: 20.px),
        border: DesignTokens.hairlineBox,
        radius: BorderRadius.circular(DesignTokens.radius.px),
        transition: const Transition.combine([
          Transition('border-color', duration: DesignTokens.motion),
          Transition('color', duration: DesignTokens.motion),
        ]),
        alignItems: AlignItems.center,
        gap: Gap.all(8.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.8.rem,
        fontWeight: FontWeight.w500,
        whiteSpace: WhiteSpace.noWrap,
      ),
      css('&:hover .notice-action').styles(
        border: const Border.all(color: DesignTokens.accent, width: Unit.pixels(1)),
        color: DesignTokens.accent,
      ),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.notice-row').styles(
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.start,
        gap: Gap.all(12.px),
      ),
    ]),
  ];
}
