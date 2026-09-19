import 'package:associate_site/constants/links.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// [LinkCard] を並べるグリッド。
class LinkCardGrid extends StatelessComponent {
  const LinkCardGrid(this.children, {super.key});

  final List<Component> children;

  @override
  Component build(BuildContext context) => div(classes: 'card-grid', children);

  @css
  static List<StyleRule> get styles => [
    css('.card-grid').styles(
      display: Display.grid,
      gap: Gap.all(24.px),
      // 下限を min() で包まないと狭幅で横スクロールが発生する。
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(min(100%, 360px), 1fr))'},
    ),
  ];
}

/// 見出しとリード文を持つリンク集のカード。
class LinkCard extends StatelessComponent {
  const LinkCard({required this.title, required this.subtitle, required this.lead, required this.children, super.key});

  final String title;

  /// 見出しに添える英字。
  final String subtitle;

  final String lead;
  final List<Component> children;

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'card',
      attributes: const {'data-reveal': ''},
      [
        p(classes: 'card-subtitle', [Component.text(subtitle)]),
        h3(classes: 'card-title', [Component.text(title)]),
        p(classes: 'card-lead', [Component.text(lead)]),
        div(classes: 'card-body', children),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.card', [
      // 小見出し・見出し・リード文・本文の 4 行を subgrid で親グリッドに預ける。
      // リード文の行数がカードごとに違っても、リンク一覧の開始位置が揃う。
      // 行間は各要素の margin で作るので、親から継承する row-gap は消す。
      css('&').styles(
        display: Display.grid,
        padding: Padding.all(40.px),
        border: const Border.all(color: DesignTokens.border, width: Unit.pixels(1)),
        radius: BorderRadius.circular(DesignTokens.radius.px),
        backgroundColor: DesignTokens.background,
        raw: {'grid-row': 'span 4', 'grid-template-rows': 'subgrid', 'row-gap': '0'},
      ),
      css('.card-subtitle').styles(
        margin: Margin.zero,
        color: DesignTokens.accent,
        fontSize: Typography.eyebrowSm,
        fontWeight: FontWeight.w600,
        textTransform: TextTransform.upperCase,
        letterSpacing: Typography.trackingLabel,
      ),
      css('.card-title').styles(
        margin: Margin.only(top: 12.px),
        color: DesignTokens.ink,
        fontSize: 1.15.rem,
        fontWeight: FontWeight.w700,
      ),
      css('.card-lead').styles(
        margin: Margin.only(top: 16.px, bottom: 32.px),
        color: DesignTokens.inkMuted,
        fontSize: 0.85.rem,
        lineHeight: 1.9.em,
      ),
      css('.card-body').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        // 行の高さがカードごとに揃うので、余った高さは下に残して上寄せにする。
        alignSelf: AlignSelf.start,
      ),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointSm.px), [
      css('.card').styles(padding: Padding.all(28.px)),
    ]),
  ];
}

/// [LinkCard] の中に置くドキュメントリンク 1 行。
class DocLink extends StatelessComponent {
  const DocLink({required this.item, super.key});

  final LinkItem item;

  @override
  Component build(BuildContext context) {
    return a(
      href: item.href,
      classes: 'doc-link',
      target: Target.blank,
      attributes: const {'rel': 'noopener noreferrer'},
      [
        span([Component.text(item.label)]),
        span(classes: 'doc-link-arrow', [Component.text('→')]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.doc-link', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 14.px),
        border: const Border.only(
          bottom: BorderSide.solid(color: DesignTokens.border, width: Unit.pixels(1)),
        ),
        transition: const Transition('color', duration: Duration(milliseconds: 200)),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        gap: Gap.all(16.px),
        color: DesignTokens.ink,
        fontSize: 0.9.rem,
        textDecoration: TextDecoration.none,
      ),
      css('&:hover').styles(color: DesignTokens.accent),
      css('.doc-link-arrow').styles(
        transition: const Transition('transform', duration: Duration(milliseconds: 200)),
        color: DesignTokens.inkMuted,
      ),
      css('&:hover .doc-link-arrow').styles(
        transform: const Transform.translate(x: Unit.pixels(4)),
        color: DesignTokens.accent,
      ),
    ]),
  ];
}

/// [LinkCard] の中に置く SNS などのリンク 1 行。
class SocialLink extends StatelessComponent {
  const SocialLink({required this.item, super.key});

  final SocialLinkItem item;

  @override
  Component build(BuildContext context) {
    return a(
      href: item.href,
      classes: 'social-link',
      target: Target.blank,
      attributes: const {'rel': 'noopener noreferrer'},
      [
        div(classes: 'social-icon', [item.icon]),
        div([
          strong(classes: 'social-title', [Component.text(item.label)]),
          span(classes: 'social-subtitle', [Component.text(item.description)]),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.social-link', [
      css('&').styles(
        display: Display.flex,
        padding: Padding.symmetric(vertical: 14.px),
        border: const Border.only(
          bottom: BorderSide.solid(color: DesignTokens.border, width: Unit.pixels(1)),
        ),
        alignItems: AlignItems.center,
        gap: Gap.all(16.px),
        color: DesignTokens.ink,
        textDecoration: TextDecoration.none,
      ),
      css('.social-icon').styles(
        display: Display.flex,
        width: 40.px,
        height: 40.px,
        border: const Border.all(color: DesignTokens.border, width: Unit.pixels(1)),
        radius: BorderRadius.circular(50.percent),
        transition: const Transition('all', duration: Duration(milliseconds: 200)),
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
      css('&:hover .social-icon').styles(
        border: const Border.all(color: DesignTokens.accent, width: Unit.pixels(1)),
        color: DesignTokens.accent,
      ),
      css('.social-title').styles(display: Display.block, fontSize: 0.9.rem, fontWeight: FontWeight.w600),
      css('.social-subtitle').styles(color: DesignTokens.inkMuted, fontSize: 0.78.rem),
    ]),
  ];
}
