import 'package:associate_site/components/icons.dart';
import 'package:associate_site/components/link.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Hero に差し込む緊急のお知らせの内容。
///
/// 掲出するものが無いときは `null` を渡す。[EmergencyNoticeBanner] 側ではなく
/// 呼び出し元 (ページ) が `null` を持つことで、出す / 出さないを 1 箇所で決める。
class EmergencyNotice {
  const EmergencyNotice({required this.title, required this.text, this.linkLabel, this.linkHref})
    : assert(
        (linkLabel == null) == (linkHref == null),
        'リンクはラベルと URL を対で指定する。片方だけでは表示できない。',
      );

  /// 見出し。⚠ アイコンの右に並ぶ。
  final String title;

  /// 本文。
  final String text;

  /// リンクの文言。[linkHref] と対で指定する。省略するとリンクを出さない。
  final String? linkLabel;

  /// リンク先。`http` で始まるものは別タブで開く。
  final String? linkHref;

  bool get hasLink => linkLabel != null && linkHref != null;
}

/// 赤系で目立たせる緊急のお知らせ。
///
/// 通常の導線 ([DesignTokens.accent]) と区別したいので、この帯の中だけ
/// [DesignTokens.alert] 系のトークンを使う。
class EmergencyNoticeBanner extends StatelessComponent {
  const EmergencyNoticeBanner(this.notice, {super.key});

  final EmergencyNotice notice;

  @override
  Component build(BuildContext context) {
    final href = notice.linkHref;
    final external = href != null && isExternalHref(href);

    return aside(
      classes: 'emergency',
      attributes: const {'aria-label': '緊急のお知らせ'},
      [
        div(classes: 'emergency-head', [
          span(classes: 'emergency-icon', [Icons.warning]),
          p(classes: 'emergency-title', [Component.text(notice.title)]),
        ]),
        p(classes: 'emergency-text', [Component.text(notice.text)]),
        if (notice.hasLink)
          linkTo(
            href: href!,
            classes: 'emergency-link',
            [
              span([Component.text(notice.linkLabel!)]),
              if (external) Icons.arrowUpRight else span(classes: 'emergency-link-arrow', [Component.text('→')]),
            ],
          ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.emergency', [
      css('&').styles(
        display: Display.flex,
        maxWidth: 46.rem,
        padding: Padding.symmetric(vertical: 20.px, horizontal: 24.px),
        // コンテナ内で中央に置く。左に寄っていると本文の続きに見えてしまう。
        margin: Margin.only(top: 48.px, left: Unit.auto, right: Unit.auto),
        border: const Border.all(color: DesignTokens.alertBorder, width: Unit.pixels(1)),
        radius: BorderRadius.circular(DesignTokens.radius.px),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.start,
        gap: Gap.all(10.px),
        backgroundColor: DesignTokens.alertSurface,
        // 左端の太い罫で「通常のカードではない」ことを示す。
        raw: {'border-left': '3px solid ${DesignTokens.alert.value}'},
      ),
      css('.emergency-head').styles(
        display: Display.flex,
        alignItems: AlignItems.center,
        gap: Gap.all(10.px),
        color: DesignTokens.alert,
      ),
      css('.emergency-icon').styles(display: Display.flex, flex: const Flex(shrink: 0)),
      css('.emergency-title').styles(
        margin: Margin.zero,
        fontSize: Typography.body,
        fontWeight: FontWeight.w700,
        lineHeight: 1.6.em,
      ),
      css('.emergency-text').styles(
        margin: Margin.zero,
        color: DesignTokens.ink,
        fontSize: Typography.bodyXs,
        lineHeight: 1.9.em,
      ),
      css('.emergency-link', [
        css('&').styles(
          display: Display.flex,
          padding: Padding.symmetric(vertical: 8.px, horizontal: 16.px),
          margin: Margin.only(top: 4.px),
          border: const Border.all(color: DesignTokens.alert, width: Unit.pixels(1)),
          radius: BorderRadius.circular(DesignTokens.radius.px),
          transition: const Transition.combine([
            Transition('border-color', duration: DesignTokens.motion),
            Transition('color', duration: DesignTokens.motion),
            Transition('background-color', duration: DesignTokens.motion),
          ]),
          alignItems: AlignItems.center,
          gap: Gap.all(8.px),
          color: DesignTokens.alert,
          fontSize: Typography.caption,
          fontWeight: FontWeight.w600,
          textDecoration: TextDecoration.none,
        ),
        css('&:hover').styles(
          border: const Border.all(color: DesignTokens.alertHover, width: Unit.pixels(1)),
          color: DesignTokens.background,
          backgroundColor: DesignTokens.alertHover,
        ),
        css('.emergency-link-arrow').styles(
          transition: const Transition('transform', duration: DesignTokens.motion),
        ),
        css('&:hover .emergency-link-arrow').styles(transform: const Transform.translate(x: Unit.pixels(4))),
      ]),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.emergency').styles(
        padding: Padding.symmetric(vertical: 18.px, horizontal: 20.px),
        margin: Margin.only(top: 36.px, left: Unit.auto, right: Unit.auto),
      ),
    ]),

    css.media(DesignTokens.reducedMotion, [
      css('.emergency .emergency-link-arrow').styles(raw: {'transition': 'none'}),
    ]),
  ];
}
