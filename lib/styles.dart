import 'package:associate_site/constants/theme.dart';
import 'package:jaspr/dom.dart';

/// サイト全体で参照するデザイントークン。
///
/// 色は [constants/theme.dart] に定義したものを再公開する。ここに無い値を
/// コンポーネント側で直書きしないこと。
abstract class DesignTokens {
  static const background = backgroundColor;
  static const surface = surfaceColor;
  static const ink = inkColor;
  static const inkMuted = inkMutedColor;
  static const border = borderColor;
  static const accent = accentColor;
  static const accentHover = accentHoverColor;
  static const gridLine = gridLineColor;
  static const accentGlow = accentGlowColor;
  static const accentGlowTransparent = accentGlowTransparentColor;
  static const heroScrimStrong = heroScrimStrongColor;
  static const heroScrim = heroScrimColor;
  static const heroScrimSoft = heroScrimSoftColor;
  static const heroScrimTransparent = heroScrimTransparentColor;
  static const heroInkMuted = heroInkMutedColor;
  static const alert = alertColor;
  static const alertHover = alertHoverColor;
  static const alertSurface = alertSurfaceColor;
  static const alertBorder = alertBorderColor;

  /// Hero の罫線グリッドの間隔。
  static const gridSize = 80;

  /// Hero の写真スライドショー。1 枚を表示しておく秒数、次の 1 枚へのクロス
  /// フェードの長さ、写真に掛けるぼかしの強さ。
  static const heroSlideSeconds = 8;
  static const heroSlideFade = Duration(milliseconds: 1200);
  static const heroSlideBlur = 2;

  /// 本文カラムの最大幅。
  static const containerWidth = 1120;

  /// セクションの上下余白。[breakpointMd] / [breakpointSm] で段階的に縮める。
  static const sectionPaddingY = 120;
  static const sectionPaddingYMd = 72;
  static const sectionPaddingYSm = 56;

  /// 画面左右の最小余白。
  static const gutter = 24;
  static const gutterSm = 20;

  /// 角丸。コーポレートサイトらしく控えめに。
  static const radius = 4;

  /// sticky ヘッダーの高さ。アンカーリンクのスクロールオフセットにも使う。
  static const headerHeight = 72;

  static const breakpointMd = 900;
  static const breakpointSm = 640;

  /// 英字は Inter、日本語は Noto Sans JP。
  static const fontSans = FontFamily.list([
    FontFamily('Inter'),
    FontFamily('Noto Sans JP'),
    FontFamilies.sansSerif,
  ]);

  /// セクション番号などに使う等幅数字。
  static const fontMono = FontFamily.list([FontFamily('Inter'), FontFamilies.monospace]);
}
