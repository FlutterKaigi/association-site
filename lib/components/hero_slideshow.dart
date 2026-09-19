import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Hero の背景で過去の FlutterKaigi の写真を順に映すスライドショー。
///
/// 操作は受け付けず、[DesignTokens.heroSlideSeconds] ごとに CSS アニメーション
/// だけで切り替えてループする。JS を使わないので静的ビルドのままで動く。
/// 写真は強くぼかしたうえで白いベールを重ね、前面の本文を読めるようにする。
///
/// 置く側の要素に `position: relative` を付け、本文には `z-index: 1` を与えること。
class HeroSlideshow extends StatelessComponent {
  const HeroSlideshow({super.key});

  /// 映す写真。増減させれば周期も切り替えのタイミングも追従する。
  static const _slides = [
    '/images/hero/group-photo-2025.webp',
    '/images/hero/group-photo-2024.webp',
    '/images/hero/group-photo-2023.webp',
  ];

  /// 写真の元の寸法。予約領域を決められるように渡しておく。
  static const _slideWidth = 1920;
  static const _slideHeight = 1280;

  /// 1 巡の長さ。1 枚あたり [DesignTokens.heroSlideSeconds] 秒。
  static Duration get _cycle => Duration(seconds: DesignTokens.heroSlideSeconds * _slides.length);

  /// ぼかしの滲みで端に素地が覗かないよう、少しだけ拡大して敷く。
  static const _slideScale = 1.12;

  @override
  Component build(BuildContext context) {
    return div(classes: 'hero-slideshow', [
      for (final (index, slide) in _slides.indexed)
        img(
          src: slide,
          // 背景として敷くだけの装飾。読み上げの対象にはしない。
          alt: '',
          width: _slideWidth,
          height: _slideHeight,
          attributes: {
            'aria-hidden': 'true',
            'decoding': 'async',
            // 最初の 1 枚だけ先に取りに行かせ、残りは本文の邪魔をしない順で読む。
            'fetchpriority': index == 0 ? 'high' : 'low',
          },
        ),
      div(classes: 'hero-slideshow-scrim', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero-slideshow', [
      css('&').styles(
        position: DesignTokens.fillParent,
        overflow: Overflow.hidden,
        pointerEvents: PointerEvents.none,
        backgroundColor: DesignTokens.background,
      ),
      css('img').styles(
        position: Position.absolute(top: 0.px, left: 0.px),
        width: 100.percent,
        height: 100.percent,
        opacity: 0,
        animation: Animation(name: 'hero-slide-fade', duration: _cycle),
        transform: const Transform.scale(_slideScale),
        raw: {
          // Jaspr 0.22.4 の [Animation.count] は `infinity` という無効な値を
          // 書き出してしまい、指定ごとアニメーションが無視される。ループは
          // ここで直接指定する。
          'animation-iteration-count': 'infinite',
          'object-fit': 'cover',
          'filter': 'blur(${DesignTokens.heroSlideBlur}px)',
        },
      ),
      // 2 枚目以降を 1 枚分ずつ後ろにずらして、順に出てくるようにする。
      for (final (index, _) in _slides.indexed.skip(1))
        css('img:nth-child(${index + 1})').styles(
          raw: {'animation-delay': '${index * DesignTokens.heroSlideSeconds}s'},
        ),
      css('.hero-slideshow-scrim').styles(
        position: DesignTokens.fillParent,
        raw: {
          'background-image':
              // 下端。次のセクションとの境目で写真を地の色に沈める。
              'linear-gradient(to bottom, '
              '${DesignTokens.heroScrimTransparent.value} 55%, '
              '${DesignTokens.heroScrim.value} 84%, '
              '${DesignTokens.background.value} 100%),'
              // 本文の載る左上を濃く、右下へ向かって薄く。
              'linear-gradient(105deg, '
              '${DesignTokens.heroScrimStrong.value} 0%, '
              '${DesignTokens.heroScrim.value} 55%, '
              '${DesignTokens.heroScrimSoft.value} 100%)',
        },
      ),
    ]),

    css.keyframes('hero-slide-fade', _fadeKeyframes),

    css.media(DesignTokens.reducedMotion, [
      // 切り替えをやめて 1 枚だけ置く。
      css('.hero-slideshow img').styles(animation: Animation.none),
      css('.hero-slideshow img:first-child').styles(opacity: 1),
    ]),
  ];

  /// 1 巡のうち自分の番だけ不透明にするアニメーション。
  ///
  /// 出入りに [DesignTokens.heroSlideFade] を使うので、前の 1 枚が消える間に
  /// 次の 1 枚が現れてクロスフェードになる。
  static Map<String, Styles> get _fadeKeyframes {
    final fade = DesignTokens.heroSlideFade.inMilliseconds / _cycle.inMilliseconds * 100;
    final slot = 100 / _slides.length;
    String at(double percent) => '${percent.toStringAsFixed(3)}%';
    return {
      '0%': const Styles(opacity: 0),
      at(fade): const Styles(opacity: 1),
      at(slot): const Styles(opacity: 1),
      at(slot + fade): const Styles(opacity: 0),
      '100%': const Styles(opacity: 0),
    };
  }
}
