import 'package:associate_site/components/contact_cta.dart';
import 'package:associate_site/components/emergency_notice.dart';
import 'package:associate_site/components/hero.dart';
import 'package:associate_site/components/info_list.dart';
import 'package:associate_site/components/link_card.dart';
import 'package:associate_site/components/notice_row.dart';
import 'package:associate_site/components/section.dart';
import 'package:associate_site/constants/contact.dart';
import 'package:associate_site/constants/documents.dart';
import 'package:associate_site/constants/links.dart';
import 'package:associate_site/constants/notices.dart';
import 'package:associate_site/constants/organization.dart';
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
  static const EmergencyNotice? _emergencyNotice = null;

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
    const InfoEntry('名称', orgNameFull),
    const InfoEntry('主たる事務所', orgAddress),
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

  /// 本文中から「お問い合わせ」セクションへ飛ばす内部リンク。
  ///
  /// フォームの URL を直接張らず、同ページの窓口までスクロールさせる。
  static Component get _contactFormLink => a(
    href: '#contact',
    classes: 'inline-link',
    [Component.text('FlutterKaigi お問い合わせフォーム')],
  );

  static List<InfoEntry> get _legal => [
    InfoEntry('事業者', orgNameFull),
    InfoEntry('代表者', orgRepresentative),
    InfoEntry('所在地', orgAddress),
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
          for (final sheet in balanceSheets) NoticeRow(item: sheet),
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
                for (final document in documents) DocLink(item: document),
              ],
            ),
            LinkCard(
              title: 'コミュニティに参加する',
              subtitle: 'Community',
              lead:
                  'FlutterKaigiのコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。'
                  'なお、FlutterKaigiについては、$orgNameの協力をもって開催されます。',
              children: [
                for (final link in socialLinks) SocialLink(item: link),
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
