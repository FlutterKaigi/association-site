import 'package:associate_site/constants/links.dart';

/// docs.flutterkaigi.jp で公開している各種ドキュメント。
///
/// 法人概要ページの「ドキュメント」カードとフッターの両方から参照する。
const documents = <LinkItem>[
  LinkItem(label: '行動規範', href: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'),
  LinkItem(label: 'プライバシーポリシー', href: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'),
  LinkItem(
    label: '反社会的勢力排除ポリシー',
    href: 'https://docs.flutterkaigi.jp/Exclusion-of-Anti-Social-Forces.ja',
  ),
  LinkItem(label: '関連イベントのガイドライン', href: 'https://docs.flutterkaigi.jp/Event-Guidelines.ja'),
  LinkItem(label: 'イベント参加規約', href: 'https://docs.flutterkaigi.jp/Terms-for-Join.ja'),
  LinkItem(label: 'ロゴ使用ガイドライン', href: 'https://docs.flutterkaigi.jp/Logo-Guidelines.ja'),
];
