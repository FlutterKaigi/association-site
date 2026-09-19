import 'package:associate_site/styles.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// 罫線グリッドと差し色の光でできた背景。
///
/// トップの [Hero] と 404 ページで共有する。置く側の要素に
/// `position: relative` を付け、本文には `z-index: 1` を与えること。
class GridBackdrop extends StatelessComponent {
  const GridBackdrop({super.key});

  /// グリッドを上から下へ、中央から外へ消していくマスク。
  /// 次のセクションとの境目に段差を作らないために掛ける。
  static const _gridMask = 'radial-gradient(125% 100% at 50% 0%, #000 28%, transparent 76%)';

  @override
  Component build(BuildContext context) {
    return div(classes: 'grid-backdrop', const [
      div(classes: 'grid-backdrop-glow', []),
      div(classes: 'grid-backdrop-lines', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.grid-backdrop', [
      css('&').styles(
        position: DesignTokens.fillParent,
        overflow: Overflow.hidden,
        pointerEvents: PointerEvents.none,
      ),
      css('> div').styles(
        position: DesignTokens.fillParent,
      ),
      // 右上から落とす差し色の光。ぼかしきっているのでマスクは要らない。
      css('.grid-backdrop-glow').styles(
        raw: {
          'background-image':
              'radial-gradient(58% 52% at 78% 16%, '
              '${DesignTokens.accentGlow.value}, ${DesignTokens.accentGlowTransparent.value} 70%)',
        },
      ),
      css('.grid-backdrop-lines').styles(
        raw: {
          'background-image':
              'linear-gradient(to right, ${DesignTokens.gridLine.value} 1px, transparent 1px),'
              'linear-gradient(to bottom, ${DesignTokens.gridLine.value} 1px, transparent 1px)',
          'background-size': '${DesignTokens.gridSize}px ${DesignTokens.gridSize}px',
          '-webkit-mask-image': _gridMask,
          'mask-image': _gridMask,
        },
      ),
    ]),
  ];
}
