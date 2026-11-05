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

  /// ホバーなど小さな状態変化の長さ。13 箇所で共有する。
  /// これより長いと、マウスが離れたあとも動いていて追従感が落ちる。
  static const motion = Duration(milliseconds: 200);

  /// 動きを減らす設定。アニメーションや transform を持つルールは必ず打ち消す。
  static const reducedMotion = MediaQuery.raw('(prefers-reduced-motion: reduce)');

  /// 罫線 1 本。カード枠・定義リストの区切り・ヘッダーの下端で共有する。
  static const hairline = BorderSide.solid(color: borderColor, width: Unit.pixels(1));

  /// 全周に [hairline] を引く。
  static const hairlineBox = Border.all(color: borderColor, width: Unit.pixels(1));

  /// 親いっぱいに敷くレイヤ。置く側の要素に `position: relative` が要る。
  ///
  /// `Unit.zero` は `0` を吐いて `0px` にならないので使わないこと。
  static const fillParent = Position.absolute(
    top: Unit.pixels(0),
    left: Unit.pixels(0),
    right: Unit.pixels(0),
    bottom: Unit.pixels(0),
  );
}

/// タイポグラフィのトークン。
///
/// [Styles] は [Unit] を取る。`0.95.rem` は拡張 getter なので `const` にできない
/// ため、ここでは [Unit.rem] で書く。出力される CSS は `0.95rem` で変わらない。
///
/// 段階を増やす前に、既にある値で代用できないか疑うこと。16px 基準で 0.05rem は
/// 0.8px しかなく、増やしても読み手には伝わらない。1 箇所でしか使わない値は
/// ここに足さず、そのコンポーネントにリテラルで書く。
abstract class Typography {
  /// ページ内の見出し。セクション見出しと 404 の見出しで共有する。
  static const heading = Unit.rem(1.75);

  /// 本文。リード文と、行の主役になるラベル。
  static const body = Unit.rem(0.95);

  /// 本文より一段小さい。定義リストの値、リンク 1 行、ボタンのラベル。
  static const bodySm = Unit.rem(0.9);

  /// さらに一段小さい。定義リストのラベル、カードのリード文、ナビゲーション。
  static const bodyXs = Unit.rem(0.85);

  /// 補足。注記、ゴーストボタン、セクション番号、リストのマーカー。
  static const caption = Unit.rem(0.8);

  /// 英字の小ラベル。ページ先頭 (Hero / 404) に置く一番大きいもの。
  static const eyebrow = Unit.rem(0.75);

  /// 英字の小ラベル。セクション見出しとカード見出しに添えるもの。
  /// [eyebrow] より一段落として、ページ > セクションの階層を作る。
  static const eyebrowSm = Unit.rem(0.7);

  /// [eyebrow] 系の字送り。大文字だけの英字は開かないと詰まって見える。
  static const trackingLabel = Unit.em(0.18);

  /// 大きな見出しの詰め。1.75rem 以上で効かせる。
  static const trackingTight = Unit.em(-0.01);
}
