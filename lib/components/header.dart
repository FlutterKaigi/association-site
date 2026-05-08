import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

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
      div(classes: 'header-logo', [
        a(href: '#home', [Component.text('一般社団法人関西開発者会議')]),
      ]),
      button(
        classes: 'menu-toggle ${_isMenuOpen ? 'open' : ''}',
        events: {'click': (e) => setState(() => _isMenuOpen = !_isMenuOpen)},
        [
          div(classes: 'bar', []),
          div(classes: 'bar', []),
          div(classes: 'bar', []),
        ],
      ),
      nav(classes: _isMenuOpen ? 'open' : '', [
        _navItem('#home', 'Top'),
      ]),
    ]);
  }

  Component _navItem(String href, String label) {
    return div(classes: 'nav-link-wrapper', [
      a(href: href, events: {'click': (e) => setState(() => _isMenuOpen = false)}, [
        Component.text(label)
      ]),
      div(classes: 'underline', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        display: Display.flex,
        position: Position.fixed(top: 0.px, left: 0.px, right: 0.px),
        zIndex: ZIndex(1000),
        padding: Padding.symmetric(horizontal: 40.px, vertical: 15.px),
        shadow: BoxShadow(
          blur: 20.px,
          color: Color('rgba(0,0,0,0.05)'),
          offsetX: 0.px,
          offsetY: 4.px,
        ),
        justifyContent: JustifyContent.spaceBetween,
        alignItems: AlignItems.center,
        backgroundColor: Color('rgba(255, 255, 255, 0.85)'),
        raw: {
          'backdrop-filter': 'blur(12px)',
          '-webkit-backdrop-filter': 'blur(12px)',
        },
      ),

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
        width: 24.px,
        height: 2.px,
        transition: Transition('all', duration: Duration(milliseconds: 300)),
        backgroundColor: Color('#111827'),
      ),

      css('.header-logo a').styles(
        color: Color('#111827'),
        fontSize: 1.5.rem,
        fontWeight: FontWeight.w800,
        textDecoration: TextDecoration.none,
      ),

      css('nav', [
        css('&').styles(
          display: Display.flex,
          alignItems: AlignItems.center,
          gap: Gap.all(8.px),
        ),
        css('.nav-link-wrapper', [
          css('&').styles(position: Position.relative()),
          css('a').styles(
            padding: Padding.symmetric(horizontal: 16.px, vertical: 8.px),
            transition: Transition('color', duration: Duration(milliseconds: 200)),
            color: Color('#4B5563'),
            fontWeight: FontWeight.w600,
            textDecoration: TextDecoration.none,
          ),
          css('&:hover a').styles(color: Color('#007AFF')),
          css('.underline').styles(
            position: Position.absolute(bottom: 0.px, left: 16.px, right: 16.px),
            height: 2.px,
            transition: Transition('transform', duration: Duration(milliseconds: 300)),
            transform: Transform.scale(0),
            backgroundColor: Color('#007AFF'),
          ),
          css('&:hover .underline').styles(transform: Transform.scale(1)),
        ]),
        css('.nav-btn').styles(
          padding: Padding.symmetric(horizontal: 24.px, vertical: 12.px),
          margin: Margin.only(left: 16.px),
          radius: BorderRadius.circular(50.px),
          shadow: BoxShadow(
            blur: 10.px,
            color: Color('rgba(0,0,0,0.1)'),
            offsetX: 0.px,
            offsetY: 4.px,
          ),
          transition: Transition('all', duration: Duration(milliseconds: 200)),
          color: Colors.white,
          fontWeight: FontWeight.bold,
          textDecoration: TextDecoration.none,
          backgroundColor: Color('#111827'),
        ),
        css('.nav-btn:hover').styles(
          transform: Transform.translate(y: (-2).px),
          backgroundColor: Color('#374151'),
        ),
      ]),
    ]),

    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('header .menu-toggle').styles(
        display: Display.flex,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),

      css('header nav').styles(
        display: Display.none,
        position: Position.absolute(top: 100.percent, left: 0.px, right: 0.px),
        padding: Padding.all(24.px),
        shadow: BoxShadow(
          blur: 20.px,
          color: Color('rgba(0,0,0,0.1)'),
          offsetX: 0.px,
          offsetY: 10.px,
        ),
        flexDirection: FlexDirection.column,
        gap: Gap.all(16.px),
        backgroundColor: Colors.white,
      ),

      css('header nav.open').styles(display: Display.flex),

      css('header .nav-link-wrapper').styles(
        width: 100.percent,
        textAlign: TextAlign.center,
      ),

      css('header .nav-btn').styles(width: 100.percent, margin: Margin.zero),

      css('header .menu-toggle.open .bar:nth-child(1)').styles(
        transform: Transform.combine([
          Transform.translate(y: 7.px),
          Transform.rotate(45.deg),
        ]),
      ),
      css('header .menu-toggle.open .bar:nth-child(2)').styles(opacity: 0),
      css('header .menu-toggle.open .bar:nth-child(3)').styles(
        transform: Transform.combine([
          Transform.translate(y: (-7).px),
          Transform.rotate((-45).deg),
        ]),
      ),
    ]),
  ];
}
