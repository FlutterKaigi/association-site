import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// 連番 + 日本語見出し + 英字サブを持つセクション。
///
/// ```
/// 01 ──────  法人概要
///            CORPORATE PROFILE
/// ```
class Section extends StatelessComponent {
  const Section({
    required this.id,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.children,
    this.tinted = false,
    super.key,
  });

  final String id;

  /// 1 始まりの連番。`01` のようにゼロ埋めで表示する。
  final int index;

  final String title;

  /// 見出しの下に添える英字。
  final String subtitle;

  /// [DesignTokens.surface] の帯を敷くかどうか。交互に切り替えてリズムを作る。
  final bool tinted;

  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return section(id: id, classes: 'section${tinted ? ' section-tinted' : ''}', [
      div(
        classes: 'section-inner',
        attributes: const {'data-reveal': ''},
        [
          div(classes: 'section-head', [
            div(classes: 'section-index', [
              span([Component.text(index.toString().padLeft(2, '0'))]),
              div(classes: 'section-index-line', []),
            ]),
            div([
              h2(classes: 'section-title', [Component.text(title)]),
              p(classes: 'section-subtitle', [Component.text(subtitle)]),
            ]),
          ]),
          div(classes: 'section-body', children),
        ],
      ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.section', [
      css('&').styles(
        padding: Padding.symmetric(vertical: DesignTokens.sectionPaddingY.px, horizontal: 0.px),
      ),
      css('&.section-tinted').styles(backgroundColor: DesignTokens.surface),
      css('.section-inner').styles(
        maxWidth: DesignTokens.containerWidth.px,
        padding: Padding.symmetric(horizontal: DesignTokens.gutter.px),
        margin: Margin.symmetric(horizontal: Unit.auto),
      ),
      css('.section-head').styles(
        display: Display.grid,
        margin: Margin.only(bottom: 48.px),
        alignItems: AlignItems.baseline,
        gap: Gap.all(32.px),
        raw: {'grid-template-columns': '200px 1fr'},
      ),
      css('.section-index', [
        css('&').styles(display: Display.flex, alignItems: AlignItems.center, gap: Gap.all(16.px)),
        css('span').styles(
          color: DesignTokens.accent,
          fontFamily: DesignTokens.fontMono,
          fontSize: 0.8.rem,
          fontWeight: FontWeight.w600,
          raw: {'letter-spacing': '0.1em'},
        ),
        css(
          '.section-index-line',
        ).styles(height: 1.px, flex: const Flex(grow: 1), backgroundColor: DesignTokens.border),
      ]),
      css('.section-title').styles(
        margin: Margin.zero,
        color: DesignTokens.ink,
        fontSize: 1.75.rem,
        fontWeight: FontWeight.w700,
        raw: {'letter-spacing': '-0.01em'},
      ),
      css('.section-subtitle').styles(
        margin: Margin.only(top: 8.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.7.rem,
        fontWeight: FontWeight.w500,
        textTransform: TextTransform.upperCase,
        raw: {'letter-spacing': '0.18em'},
      ),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointMd.px), [
      css('.section').styles(
        padding: Padding.symmetric(vertical: DesignTokens.sectionPaddingYMd.px, horizontal: 0.px),
      ),
      css('.section .section-head').styles(
        margin: Margin.only(bottom: 32.px),
        gap: Gap.all(16.px),
        raw: {'grid-template-columns': '1fr'},
      ),
      css('.section .section-index').styles(maxWidth: 200.px),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.section').styles(
        padding: Padding.symmetric(vertical: DesignTokens.sectionPaddingYSm.px, horizontal: 0.px),
      ),
      css('.section .section-inner').styles(padding: Padding.symmetric(horizontal: DesignTokens.gutterSm.px)),
      css('.section .section-title').styles(fontSize: 1.4.rem),
    ]),
  ];
}
