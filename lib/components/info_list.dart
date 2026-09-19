import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// [InfoList] の 1 行。
class InfoEntry {
  /// 値がプレーンテキストだけの行。
  const InfoEntry(this.label, this.value) : children = const [];

  /// 値に箇条書きなどを含む行。
  const InfoEntry.rich(this.label, this.children) : value = null;

  final String label;
  final String? value;
  final List<Component> children;
}

/// ラベルと値を並べる定義リスト。法人概要と特定商取引法表記の両方に使う。
class InfoList extends StatelessComponent {
  const InfoList(this.entries, {super.key});

  final List<InfoEntry> entries;

  @override
  Component build(BuildContext context) {
    return dl(classes: 'info-list', [
      for (final entry in entries) ...[
        dt([Component.text(entry.label)]),
        dd([if (entry.value case final value?) Component.text(value), ...entry.children]),
      ],
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.info-list', [
      css('&').styles(
        display: Display.grid,
        margin: Margin.zero,
        alignItems: AlignItems.baseline,
        // ラベルは最長の「代金の支払い時期および決済方法」が 1 行に収まる幅。
        // 値側を minmax(0, 1fr) にしないと長い文でカラムが押し広げられる。
        raw: {'grid-template-columns': '240px minmax(0, 1fr)'},
      ),
      css('dt').styles(
        padding: Padding.symmetric(vertical: 20.px),
        border: const Border.only(top: DesignTokens.hairline),
        color: DesignTokens.ink,
        fontSize: Typography.bodyXs,
        fontWeight: FontWeight.w600,
        // 2 行になるとき「…決済方 / 法」のような割れ方をさせない。
        raw: {'text-wrap': 'balance'},
      ),
      css('dd').styles(
        // 1 行が長すぎると読みづらいので、和文で 45 字前後に収める。
        maxWidth: 42.rem,
        padding: Padding.symmetric(vertical: 20.px),
        margin: Margin.zero,
        border: const Border.only(top: DesignTokens.hairline),
        color: DesignTokens.inkMuted,
        fontSize: Typography.bodySm,
        lineHeight: 2.em,
        // 最終行が 1 語だけ残るのを避ける。
        raw: {'text-wrap': 'pretty'},
      ),
      // 本文中のアンカーリンク。下線と差し色だけで、ボタンには見せない。
      css('dd .inline-link', [
        css('&').styles(
          transition: const Transition('color', duration: DesignTokens.motion),
          color: DesignTokens.accent,
          textDecoration: const TextDecoration(line: TextDecorationLine.underline),
          raw: {'text-underline-offset': '0.2em'},
        ),
        css('&:hover').styles(color: DesignTokens.accentHover),
      ]),
      css('dd ol').styles(
        padding: Padding.only(left: 1.6.em),
        margin: Margin.only(top: 12.px, bottom: 0.px),
      ),
      css('dd li').styles(padding: Padding.only(left: 4.px)),
      // 番号だけ差し色にして、条文の項目であることを示す。
      css(
        'dd li::marker',
      ).styles(color: DesignTokens.accent, fontSize: Typography.caption, fontWeight: FontWeight.w600),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.info-list').styles(raw: {'grid-template-columns': '1fr'}),
      // 1 カラムに落ちても色や字送りは変えない。ラベルと値の区別は
      // 積み上げ順と余白だけで付ける。
      css('.info-list dt').styles(
        padding: Padding.only(top: 18.px),
        lineHeight: 1.6.em,
      ),
      css('.info-list dd').styles(
        padding: Padding.only(top: 2.px, bottom: 18.px),
        border: Border.none,
      ),
    ]),
  ];
}
