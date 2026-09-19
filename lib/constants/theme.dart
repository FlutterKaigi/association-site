import 'package:jaspr/dom.dart';

/// ページ地。
const backgroundColor = Color('#FFFFFF');

/// セクションを交互に塗り分けるための帯 / カードの下地。
const surfaceColor = Color('#F5F6F8');

/// 本文・見出し。
const inkColor = Color('#101114');

/// 補助テキスト、英字ラベル。
const inkMutedColor = Color('#6B7280');

/// 罫線、カード枠、定義リストの区切り。
const borderColor = Color('#E6E8EC');

/// 差し色。リンク、セクション番号、下線、CTA に限って使う。
const accentColor = Color('#027DFD');

/// [accentColor] のホバー時。
const accentHoverColor = Color('#0057B8');

/// Hero の背景に敷く罫線グリッド。[borderColor] より一段薄い。
const gridLineColor = Color('#EDEFF2');

/// Hero の背景に落とす [accentColor] の光。透明側の停止色と対で使う。
const accentGlowColor = Color('rgba(2, 125, 253, 0.08)');
const accentGlowTransparentColor = Color('rgba(2, 125, 253, 0)');

/// Hero の写真スライドショーに重ねる白いベール。写真の上でも本文が読めるように、
/// 文字の載る左上ほど濃く、右下へ向かって薄くする。透明側の停止色と対で使う。
///
/// 濃さは実際の写真をぼかして測って決めてある。本文が載る範囲の最も暗いところ
/// でも背景が rgb(228) までしか沈まないので、[heroInkMutedColor] で 4.5:1 を保てる。
const heroScrimStrongColor = Color('rgba(255, 255, 255, 0.95)');
const heroScrimColor = Color('rgba(255, 255, 255, 0.90)');
const heroScrimSoftColor = Color('rgba(255, 255, 255, 0.74)');
const heroScrimTransparentColor = Color('rgba(255, 255, 255, 0)');

/// 写真の上に載る Hero の補助テキスト。[inkMutedColor] は純白の上で 4.83:1 しか
/// なく、写真が透けるぶんだけ AA を割ってしまうので、Hero に限って一段暗くする。
const heroInkMutedColor = Color('#5A6270');

/// 緊急のお知らせ。目立たせたい場面に限って使い、[accentColor] と併用しない。
const alertColor = Color('#D92D20');

/// [alertColor] のホバー時。
const alertHoverColor = Color('#B42318');

/// 緊急のお知らせの下地。
const alertSurfaceColor = Color('#FEF3F2');

/// 緊急のお知らせの枠線。
const alertBorderColor = Color('#FDA29B');
