import 'package:associate_site/constants/links.dart';
import 'package:associate_site/constants/organization.dart';
import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// sticky なサイトヘッダー。狭幅ではハンバーガーメニューに畳む。
@client
class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  bool _isMenuOpen = false;

  @override
  Component build(BuildContext context) {
    return header([
      a(href: '/', classes: 'header-logo', [
        img(src: '/images/logo.svg', alt: '', width: 32, height: 32),
        Component.text(orgName),
      ]),
      button(
        classes: 'menu-toggle ${_isMenuOpen ? 'open' : ''}',
        attributes: {'aria-label': 'メニュー', 'aria-expanded': '$_isMenuOpen'},
        events: {'click': (e) => setState(() => _isMenuOpen = !_isMenuOpen)},
        [div(classes: 'bar', []), div(classes: 'bar', []), div(classes: 'bar', [])],
      ),
      nav(classes: _isMenuOpen ? 'open' : '', [
        for (final item in navItems) _navItem(item),
      ]),
    ]);
  }

  Component _navItem(LinkItem item) {
    return div(classes: 'nav-link-wrapper', [
      a(
        href: item.href,
        events: {'click': (e) => setState(() => _isMenuOpen = false)},
        [
          Component.text(item.label),
        ],
      ),
      div(classes: 'underline', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        display: Display.flex,
        position: Position.sticky(top: 0.px),
        zIndex: const ZIndex(1000),
        height: DesignTokens.headerHeight.px,
        padding: Padding.symmetric(horizontal: DesignTokens.gutter.px),
        border: const Border.only(bottom: DesignTokens.hairline),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        backgroundColor: DesignTokens.background,
      ),

      css('.header-logo', [
        css('&').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: Gap.all(10.px),
          color: DesignTokens.ink,
          fontSize: Typography.body,
          fontWeight: FontWeight.w700,
          textDecoration: TextDecoration.none,
          letterSpacing: const Unit.em(0.01),
        ),
        css('img').styles(radius: BorderRadius.circular(50.percent)),
      ]),

      css('.menu-toggle').styles(
        display: Display.none,
        position: Position.relative(),
        width: 44.px,
        height: 44.px,
        padding: Padding.zero,
        border: Border.none,
        outline: Outline.unset,
        cursor: Cursor.pointer,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
        gap: Gap.all(5.px),
        backgroundColor: Colors.transparent,
      ),

      css('.menu-toggle .bar').styles(
        display: Display.block,
        width: 22.px,
        height: 1.5.px,
        transition: const Transition.combine([
          Transition('transform', duration: Duration(milliseconds: 300)),
          Transition('opacity', duration: Duration(milliseconds: 300)),
        ]),
        backgroundColor: DesignTokens.ink,
      ),

      css('nav', [
        css('&').styles(display: Display.flex, alignItems: AlignItems.center, gap: Gap.all(4.px)),
        css('.nav-link-wrapper', [
          css('&').styles(position: Position.relative()),
          css('a').styles(
            display: Display.block,
            padding: Padding.symmetric(horizontal: 14.px, vertical: 8.px),
            transition: const Transition('color', duration: DesignTokens.motion),
            color: DesignTokens.inkMuted,
            fontSize: 0.85.rem,
            fontWeight: FontWeight.w500,
            textDecoration: TextDecoration.none,
          ),
          css('&:hover a').styles(color: DesignTokens.ink),
          css('.underline').styles(
            position: Position.absolute(bottom: 4.px, left: 14.px, right: 14.px),
            height: 1.px,
            transition: const Transition('transform', duration: Duration(milliseconds: 250)),
            transform: const Transform.scale(0),
            backgroundColor: DesignTokens.accent,
          ),
          css('&:hover .underline').styles(transform: const Transform.scale(1)),
        ]),
      ]),
    ]),

    css.media(MediaQuery.screen(maxWidth: DesignTokens.breakpointMd.px), [
      css('header .menu-toggle').styles(
        display: Display.flex,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),

      css('header nav').styles(
        display: Display.none,
        position: Position.absolute(top: 100.percent, left: 0.px, right: 0.px),
        padding: Padding.symmetric(vertical: 16.px, horizontal: DesignTokens.gutter.px),
        border: const Border.only(bottom: DesignTokens.hairline),
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.stretch,
        gap: Gap.all(4.px),
        backgroundColor: DesignTokens.background,
      ),

      css('header nav.open').styles(display: Display.flex),

      css('header .nav-link-wrapper a').styles(
        padding: Padding.symmetric(vertical: 12.px, horizontal: 0.px),
      ),

      css('header .menu-toggle.open .bar:nth-child(1)').styles(
        transform: const Transform.combine([Transform.translate(y: Unit.pixels(7)), Transform.rotate(Angle.deg(45))]),
      ),
      css('header .menu-toggle.open .bar:nth-child(2)').styles(opacity: 0),
      css('header .menu-toggle.open .bar:nth-child(3)').styles(
        transform: const Transform.combine([
          Transform.translate(y: Unit.pixels(-7)),
          Transform.rotate(Angle.deg(-45)),
        ]),
      ),
    ]),
  ];
}
