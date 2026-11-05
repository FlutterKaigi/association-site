import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// インライン SVG のブランドアイコン。
///
/// `assets/*.svg` は `web/` 配下ではないため静的ビルドの出力に含まれない。
/// また `currentColor` で塗って文字色に追従させたいので、外部ファイルではなく
/// インラインで持つ。
abstract class Icons {
  /// X (旧 Twitter)。
  static Component get x => _brandIcon(
    'M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 '
    '2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z',
  );

  /// GitHub。
  static Component get github => _brandIcon(
    'M12 .5C5.37.5 0 5.87 0 12.5c0 5.3 3.438 9.8 8.205 11.387.6.113.82-.258.82-.577 '
    '0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.333-1.755-1.333-1.755'
    '-1.09-.745.083-.73.083-.73 1.205.086 1.838 1.237 1.838 1.237 1.07 1.834 2.809 1.304 3.495.997'
    '.108-.776.42-1.305.762-1.605-2.665-.303-5.467-1.333-5.467-5.932 0-1.31.469-2.382 1.236-3.221'
    '-.124-.303-.536-1.524.117-3.176 0 0 1.008-.323 3.301 1.23a11.5 11.5 0 0 1 3.003-.404c1.02.005 '
    '2.047.138 3.006.404 2.29-1.553 3.297-1.23 3.297-1.23.655 1.652.243 2.873.12 3.176.77.839 '
    '1.234 1.911 1.234 3.221 0 4.61-2.807 5.625-5.479 5.922.431.372.815 1.103.815 2.222 0 1.605'
    '-.015 2.898-.015 3.293 0 .322.216.696.825.578C20.565 22.295 24 17.797 24 12.5 24 5.87 18.627 '
    '.5 12 .5z',
  );

  /// Medium。
  static Component get medium => _brandIcon(
    'M13.54 12a6.8 6.8 0 0 1-6.77 6.82A6.8 6.8 0 0 1 0 12a6.8 6.8 0 0 1 6.77-6.82A6.8 6.8 0 0 1 13.54 12zm7.42 0'
    'c0 3.54-1.51 6.42-3.38 6.42-1.87 0-3.39-2.88-3.39-6.42s1.52-6.42 3.39-6.42 3.38 2.88 3.38 6.42M24 12'
    'c0 3.17-.53 5.75-1.19 5.75-.66 0-1.19-2.58-1.19-5.75s.53-5.75 1.19-5.75C23.47 6.25 24 8.83 24 12z',
  );

  /// YouTube。
  static Component get youtube => _brandIcon(
    'M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 '
    '0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 '
    '9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 '
    '15.568V8.432L15.818 12l-6.273 3.568z',
  );

  /// connpass。公式のブランドアイコンが SVG で配布されていないため、
  /// イベント一覧を示すカレンダーで代用する。
  static Component get connpass => svg(
    viewBox: '0 0 24 24',
    width: 20.px,
    height: 20.px,
    attributes: const {'aria-hidden': 'true'},
    [
      path(
        d: 'M4.5 6h15v14.5h-15z',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        attributes: const {'stroke-linejoin': 'round'},
        const [],
      ),
      path(
        d: 'M4.5 10.5h15',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        const [],
      ),
      path(
        d: 'M8.5 3.5v4M15.5 3.5v4',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        attributes: const {'stroke-linecap': 'round'},
        const [],
      ),
    ],
  );

  /// 警告 (⚠)。緊急のお知らせの見出しに添える。
  static Component get warning => svg(
    viewBox: '0 0 24 24',
    width: 20.px,
    height: 20.px,
    attributes: const {'aria-hidden': 'true'},
    [
      path(
        d: 'M12 3.8 2.2 20.2h19.6z',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        attributes: const {'stroke-linejoin': 'round'},
        const [],
      ),
      path(
        d: 'M12 9.6v4.2',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        attributes: const {'stroke-linecap': 'round'},
        const [],
      ),
      path(
        d: 'M12 17.1h.01',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.8',
        attributes: const {'stroke-linecap': 'round'},
        const [],
      ),
    ],
  );

  /// 外部リンクを示す矢印。
  static Component get arrowUpRight => svg(
    viewBox: '0 0 24 24',
    width: 16.px,
    height: 16.px,
    attributes: const {'aria-hidden': 'true'},
    [
      path(
        d: 'M7 17L17 7M7 7h10v10',
        fill: const Color('none'),
        stroke: const Color('currentColor'),
        strokeWidth: '1.6',
        const [],
      ),
    ],
  );

  static Component _brandIcon(String d) => svg(
    viewBox: '0 0 24 24',
    width: 20.px,
    height: 20.px,
    attributes: const {'aria-hidden': 'true'},
    [
      path(d: d, fill: const Color('currentColor'), const []),
    ],
  );
}
