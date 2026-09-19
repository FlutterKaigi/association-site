import 'package:associate_site/components/contact_cta.dart';
import 'package:associate_site/components/emergency_notice.dart';
import 'package:associate_site/components/hero.dart';
import 'package:associate_site/components/icons.dart';
import 'package:associate_site/components/info_list.dart';
import 'package:associate_site/components/link_card.dart';
import 'package:associate_site/components/notice_row.dart';
import 'package:associate_site/components/section.dart';
import 'package:associate_site/constants/contact.dart';
import 'package:associate_site/constants/documents.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// 法人概要・電子公告・特定商取引法表記・関連リンクをまとめた唯一のページ。
class CorporateInfoPage extends StatelessComponent {
  const CorporateInfoPage({super.key});

  /// Hero のリード文の下に出す緊急のお知らせ。
  ///
  /// 掲出するものが無いあいだは `null` にしておく。
  ///
  /// ```dart
  /// static const EmergencyNotice? _emergencyNotice = null;
  /// ```
  ///
  /// 出すときは次のように書き換える。
  ///
  /// ```dart
  /// static const _emergencyNotice = EmergencyNotice(
  ///   title: 'FlutterKaigi YYYY の開催延期について',
  ///   text: '台風の接近にともない、MM月DD日の開催を延期いたします。詳細は下記のお知らせをご確認ください。',
  ///   linkLabel: '詳細を見る',
  ///   linkHref: 'https://flutterkaigi.jp/',
  /// );
  /// ```
  /// static const EmergencyNotice? _emergencyNotice = null;
  static const _emergencyNotice = EmergencyNotice(
    title: 'FlutterKaigi YYYY の開催延期について',
    text: '台風の接近にともない、MM月DD日の開催を延期いたします。詳細は下記のお知らせをご確認ください。',
    linkLabel: '詳細を見る',
    linkHref: 'https://flutterkaigi.jp/',
  );

  /// 定款第 3 条（目的）の柱書。
  static const _purposeLead =
      '当法人は、エンジニアの技術共有およびコミュニケーションを支援、充実することを目的とし、'
      'その目的に資するため、次の事業を行う。';

  /// 定款第 3 条各号の事業。
  static const _activities = <String>[
    'エンジニアを対象とした催しの開催および運営',
    'エンジニアの育成の推進を図る活動',
    '技術共有、コミュニケーションを目的とした催しの支援および人材育成',
    '前各号に附帯又は関連する一切の事業',
  ];

  static List<InfoEntry> get _profile => [
    const InfoEntry('名称', '一般社団法人FlutterKaigi / FlutterKaigi Association'),
    const InfoEntry('主たる事務所', '東京都渋谷区渋谷2丁目19番15号宮益坂ビルディング609'),
    InfoEntry.rich('目的', [
      Component.text(_purposeLead),
      ol([
        for (final activity in _activities) li([Component.text(activity)]),
      ]),
    ]),
    // 定款第 4 条（公告の方法）の全文。
    const InfoEntry(
      '法人の公告方法',
      '当法人の公告は、電子公告により行う。'
          'ただし、事故その他やむを得ない事由によって電子公告による公告をすることができない場合は、'
          '官報に掲載する方法により行う。',
    ),
  ];

  /// 貸借対照表。新しい年度が上に来るよう降順で持つ。
  static const _notices = <(String, String)>[
    ('2025年度(令和7年度)貸借対照表', 'https://drive.google.com/file/d/1T6cHwex1rjlLvs3Zhx3vA-_kxtAwyc_b/view?usp=sharing'),
    ('2024年度(令和6年度)貸借対照表', 'https://drive.google.com/file/d/1hKGPkBDZ5224OMVJrYeTyMwx0MQvv88K/view?usp=sharing'),
    ('2023年度(令和5年度)貸借対照表', 'https://drive.google.com/file/d/1bNfLuma7ZMzeX_wOzu5GCvfG8RMASXXD/view?usp=sharing'),
    ('2022年度(令和4年度)貸借対照表', 'https://drive.google.com/file/d/178O_RqmSR-qdaSGbv9RN6IoEuM7I6If8/view?usp=sharing'),
  ];

  /// 本文中から「お問い合わせ」セクションへ飛ばす内部リンク。
  ///
  /// フォームの URL を直接張らず、同ページの窓口までスクロールさせる。
  static Component get _contactFormLink => a(
    href: '#contact',
    classes: 'inline-link',
    [Component.text('FlutterKaigi お問い合わせフォーム')],
  );

  static final _legal = <InfoEntry>[
    InfoEntry('事業者', '一般社団法人FlutterKaigi / FlutterKaigi Association'),
    InfoEntry('代表者', '菊池 紘 / Hiroshi Kikuchi'),
    InfoEntry('所在地', '東京都渋谷区渋谷2丁目19番15号宮益坂ビルディング609'),
    InfoEntry.rich('電話番号', [
      Component.text('※当社ではお電話によるお問い合わせは承っておりません。'),
      _contactFormLink,
      Component.text('までご連絡くださいますようお願いいたします。'),
    ]),
    InfoEntry('販売価格', '各商品に表記された価格に準じます。'),
    InfoEntry('サービス代金以外の料金', '注文手数料（コンビニ、ATM 決済の場合）'),
    InfoEntry(
      '代金の支払い時期および決済方法',
      'クレジットカード（即時）、コンビニ決済（支払期限まで）、ATM 決済（支払期限まで） ※予定が変更される場合があります。',
    ),
    InfoEntry('サービスの提供時期', 'FlutterKaigiの開催日'),
    InfoEntry.rich('返品・返金', [
      Component.text(
        'チケット購入から 50 日未満、かつ決済方法がクレジットカードの場合のみ、チケットのキャンセル・返金が可能です。'
        'コンビニ、ATM 決済ではキャンセル・返金できませんので、あらかじめご了承ください。'
        'キャンセルをご希望の場合は、購入後に届く購入完了メールに記載されている購入者のお名前、注文番号を添えて、',
      ),
      _contactFormLink,
      Component.text('よりご連絡ください。'),
    ]),
  ];

  @override
  Component build(BuildContext context) {
    return main_([
      const Hero(notice: _emergencyNotice),

      Section(
        id: 'profile',
        index: 1,
        title: '法人概要',
        subtitle: 'Corporate Profile',
        children: [InfoList(_profile)],
      ),

      Section(
        id: 'notices',
        index: 2,
        title: '電子公告',
        subtitle: 'Public Notice',
        tinted: true,
        children: [
          for (final (label, href) in _notices) NoticeRow(label: label, href: href),
        ],
      ),

      Section(
        id: 'legal',
        index: 3,
        title: '特定商取引法に基づく表記',
        subtitle: 'Legal Notice',
        children: [InfoList(_legal)],
      ),

      Section(
        id: 'links',
        index: 4,
        title: 'ドキュメントとコミュニティ',
        subtitle: 'Documents & Community',
        tinted: true,
        children: [
          LinkCardGrid([
            LinkCard(
              title: 'ドキュメント',
              subtitle: 'Documents',
              lead: '当法人が定めるポリシー・ガイドライン・規約です。いずれも日本語で公開しています。',
              children: [
                for (final (label, href) in documents) DocLink(label: label, href: href),
              ],
            ),
            LinkCard(
              title: 'コミュニティに参加する',
              subtitle: 'Community',
              lead:
                  'FlutterKaigiのコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。'
                  'なお、FlutterKaigiについては、一般社団法人FlutterKaigiの協力をもって開催されます。',
              children: [
                SocialLink(
                  icon: Icons.connpass,
                  title: 'connpass',
                  subtitle: 'イベントの開催情報を確認して申し込む',
                  href: 'https://flutterkaigi.connpass.com/',
                ),
                SocialLink(
                  icon: Icons.x,
                  title: 'X',
                  subtitle: '@FlutterKaigiをフォローする',
                  href: 'https://x.com/FlutterKaigi',
                ),
                SocialLink(
                  icon: Icons.github,
                  title: 'GitHub',
                  subtitle: 'リポジトリに貢献する',
                  href: 'https://github.com/FlutterKaigi',
                ),
                SocialLink(
                  icon: Icons.medium,
                  title: 'Medium',
                  subtitle: 'ブログ記事を読む',
                  href: 'https://medium.com/flutterkaigi',
                ),
                SocialLink(
                  icon: Icons.youtube,
                  title: 'YouTube',
                  subtitle: 'セッション動画を見る',
                  href: 'https://www.youtube.com/@flutterkaigi',
                ),
              ],
            ),
          ]),
        ],
      ),

      const Section(
        id: 'contact',
        index: 5,
        title: 'お問い合わせ',
        subtitle: 'Contact',
        children: [ContactCta(href: contactFormUrl)],
      ),
    ]);
  }
}
