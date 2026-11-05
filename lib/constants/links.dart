import 'package:associate_site/components/icons.dart';
import 'package:jaspr/jaspr.dart';

/// ラベルと URL の組。
///
/// `(String, String)` のタプルで持つと、要素の順序を取り違えてもコンパイルが
/// 通ってしまう。実際に `(label, href)` と `(href, label)` が混在していたので、
/// 名前付きのフィールドで固定する。
class LinkItem {
  const LinkItem({required this.label, required this.href});

  final String label;
  final String href;
}

/// FlutterKaigi の各種アカウント。
///
/// 法人概要ページの「コミュニティに参加する」カードとフッターの両方から
/// 参照する。アイコンと説明文はカードだけが使う。
class SocialLinkItem extends LinkItem {
  const SocialLinkItem({required super.label, required super.href, required this.description, required this.icon});

  /// カードに出す一行の説明。
  final String description;

  /// カードに出すブランドアイコン。
  final Component icon;
}

/// ヘッダーのナビゲーション。`href` は法人概要ページ内のアンカー。
const navItems = <LinkItem>[
  LinkItem(label: '法人概要', href: '/#profile'),
  LinkItem(label: '電子公告', href: '/#notices'),
  LinkItem(label: '特定商取引法', href: '/#legal'),
  LinkItem(label: 'リンク', href: '/#links'),
  LinkItem(label: 'お問い合わせ', href: '/#contact'),
];

/// [SocialLinkItem.icon] が [Icons] の getter で const にできないため、
/// このリストだけ `final` で持つ。
final socialLinks = <SocialLinkItem>[
  SocialLinkItem(
    label: 'connpass',
    href: 'https://flutterkaigi.connpass.com/',
    description: 'イベントの開催情報を確認して申し込む',
    icon: Icons.connpass,
  ),
  SocialLinkItem(
    label: 'X',
    href: 'https://x.com/FlutterKaigi',
    description: '@FlutterKaigiをフォローする',
    icon: Icons.x,
  ),
  SocialLinkItem(
    label: 'GitHub',
    href: 'https://github.com/FlutterKaigi',
    description: 'リポジトリに貢献する',
    icon: Icons.github,
  ),
  SocialLinkItem(
    label: 'Medium',
    href: 'https://medium.com/flutterkaigi',
    description: 'ブログ記事を読む',
    icon: Icons.medium,
  ),
  SocialLinkItem(
    label: 'YouTube',
    href: 'https://www.youtube.com/@flutterkaigi',
    description: 'セッション動画を見る',
    icon: Icons.youtube,
  ),
];

/// 過去に開催したカンファレンス。新しい回が先。
///
/// 各回のサイトは `https://<年>.flutterkaigi.jp/` に置かれている。
const conferenceYears = <int>[2026, 2025, 2024, 2023, 2022, 2021];

/// [conferenceYears] をフッターに並べるリンクにする。
List<LinkItem> get conferenceLinks => [
  for (final year in conferenceYears) LinkItem(label: 'FlutterKaigi $year', href: 'https://$year.flutterkaigi.jp/'),
];
