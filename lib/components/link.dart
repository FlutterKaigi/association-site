import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// `http` で始まる URL を外部リンクとみなす。
///
/// サイト内の導線は `/` 始まりのパスか `#contact` のようなアンカーしかないので、
/// この判定で足りる。
bool isExternalHref(String href) => href.startsWith('http');

/// 外部リンクなら別タブで開く `a`。
///
/// `target="_blank"` だけを付けると、開いた先から `window.opener` 経由でこの
/// ページを操作できてしまう。`rel="noopener noreferrer"` と必ず対にするために、
/// サイト内のリンクは原則この関数を通す。内部リンクには何も付けないので、
/// 同一ページ内のアンカーをそのまま渡してよい。
Component linkTo(List<Component> children, {required String href, String? classes}) {
  final external = isExternalHref(href);
  return a(
    href: href,
    classes: classes,
    target: external ? Target.blank : null,
    attributes: external ? const {'rel': 'noopener noreferrer'} : null,
    children,
  );
}
