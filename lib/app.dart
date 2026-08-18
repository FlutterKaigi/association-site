import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:associate_site/styles.dart'; 

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-container', [
      Router(routes: [
        Route(path: '/', builder: (context, state) => const CorporateInfoPage()),
      ]),
      footer([
        p([text('© 2021-2026 一般社団法人FlutterKaigi')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('html, body').styles(
      margin: Margin.zero,
      padding: Padding.zero,
      backgroundColor: DesignTokens.background,
      color: DesignTokens.text,
      fontFamily: FontFamily('sans-serif'),
    ),
    css('.content-wrapper').styles(
      maxWidth: DesignTokens.containerWidth.px,
      margin: Margin.symmetric(horizontal: Unit.auto),
      padding: Padding.symmetric(vertical: DesignTokens.sectionPadding.px, horizontal: 24.px),
    ),
    css('.info-section').styles(margin: Margin.only(bottom: 48.px)),
    css('h3').styles(
      fontSize: 1.15.rem,
      fontWeight: FontWeight.w700,
      margin: Margin.only(bottom: 12.px),
    ),
    css('.sub-label').styles(
      display: Display.block,
      margin: Margin.only(top: 24.px),
      fontWeight: FontWeight.bold,
      color: DesignTokens.primary,
    ),
    css('.announcement-row').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
      margin: Margin.only(top: 20.px),
    ),
    css('.pdf-button').styles(
      backgroundColor: Color('#FF5242'),
      color: Colors.white,
      padding: Padding.symmetric(vertical: 10.px, horizontal: 28.px),
      textDecoration: TextDecoration.none,
      radius: BorderRadius.circular(2.px),
      fontWeight: FontWeight.bold,
    ),
    css('.cards-grid').styles(
      display: Display.grid,
      raw: {'grid-template-columns': 'repeat(auto-fit, minmax(400px, 1fr))'},
      gap: Gap.all(24.px),
      margin: Margin.only(top: 40.px),
    ),
    css('.card').styles(
      display: Display.flex,
      flexDirection: FlexDirection.column,
      backgroundColor: Color('rgba(255, 255, 255, 0.6)'),
      padding: Padding.all(32.px),
      radius: BorderRadius.circular(24.px),
      border: Border.all(color: Color.rgba(0, 0, 0, 0.05), width: 1.px),
      gap: Gap.all(16.px),
    ),
    css('.doc-link').styles(
      display: Display.flex,
      justifyContent: JustifyContent.spaceBetween,
      padding: Padding.symmetric(vertical: 8.px),
      color: Color('#007AFF'),
      textDecoration: TextDecoration.none,
    ),
    css('.social-tile').styles(
      display: Display.flex,
      alignItems: AlignItems.center,
      padding: Padding.all(16.px),
      backgroundColor: Color('#E3F2FD'),
      radius: BorderRadius.circular(16.px),
      textDecoration: TextDecoration.none,
      color: DesignTokens.text,
    ),
    css('.tile-icon').styles(
      width: 40.px,
      height: 40.px,
      margin: Margin.only(right: 16.px),
      backgroundColor: Color('#BBDEFB'),
      radius: BorderRadius.circular(50.percent),
      display: Display.flex,
      justifyContent: JustifyContent.center,
      alignItems: AlignItems.center,
    ),
    css('.tile-title').styles(display: Display.block, fontWeight: FontWeight.bold),
    css('.tile-sub').styles(fontSize: 0.85.rem, color: DesignTokens.muted),
  ];
}

class CorporateInfoPage extends StatelessComponent {
  const CorporateInfoPage({super.key});

  @override
  Component build(BuildContext context) {
    return main_([
      div(classes: 'content-wrapper', [
        _section('名称', [p([text('一般社団法人FlutterKaigi / FlutterKaigi Association')])]),
        _section('主たる事務所', [p([text('東京都渋谷区渋谷2丁目19番15号宮益坂ビルディング609')])]),
        _section('法人の公告方法', [
          p([text('当法人の公告は、電子公告により行う')]),
          div(classes: 'announcement-row', [
            span([text('2022年度(令和4年度)貸借対照表')]),
            a(href: 'https://drive.google.com/file/d/178O_RqmSR-qdaSGbv9RN6IoEuM7I6If8/view?usp=sharing', classes: 'pdf-button', [text('PDF を開く')]),
          ]),
          div(classes: 'announcement-row', [
            span([text('2023年度(令和5年度)貸借対照表')]),
            a(href: 'https://drive.google.com/file/d/1bNfLuma7ZMzeX_wOzu5GCvfG8RMASXXD/view?usp=sharing', classes: 'pdf-button', [text('PDF を開く')]),
          ]),
          div(classes: 'announcement-row', [
            span([text('2024年度(令和6年度)貸借対照表')]),
            a(href: 'https://drive.google.com/file/d/1hKGPkBDZ5224OMVJrYeTyMwx0MQvv88K/view?usp=sharing', classes: 'pdf-button', [text('PDF を開く')]),
          ]),
          div(classes: 'announcement-row', [
            span([text('2025年度(令和7年度)貸借対照表')]),
            a(href: 'https://drive.google.com/file/d/1T6cHwex1rjlLvs3Zhx3vA-_kxtAwyc_b/view?usp=sharing', classes: 'pdf-button', [text('PDF を開く')]),
          ]),
        ]),
        _section('特定商取引法に基づく表記', [
          _sub('事業者'), p([text('一般社団法人FlutterKaigi / FlutterKaigi Association')]),
          _sub('代表者'), p([text('菊池紘 / Hiroshi Kikuchi')]),
          _sub('所在地'), p([text('東京都渋谷区渋谷2丁目19番15号宮益坂ビルディング609')]),
          _sub('電話番号'), p([text('※当社ではお電話によるお問い合わせは承っておりません。FlutterKaigi お問い合わせフォーム までご連絡くださいますようお願いいたします。')]),
          _sub('販売価格'), p([text('各商品に表記された価格に準じます。')]),
          _sub('サービス代金以外の料金'), p([text('注文手数料（コンビニ、ATM 決済の場合）')]),
          _sub('代金の支払い時期および決済方法'), p([text('クレジットカード（即時）、コンビニ決済（支払期限まで）、ATM 決済（支払期限まで） ※予定が変更される場合があります。')]),
          _sub('サービスの提供時期'), p([text('FlutterKaigiの開催日')]),
          _sub('返品・返金'), p([text('チケット購入から 50 日未満、かつ決済方法がクレジットカードの場合のみ、チケットのキャンセル・返金が可能です。コンビニ、ATM 決済ではキャンセル・返金できませんので、あらかじめご了承ください。キャンセルをご希望の場合は、購入後に届く購入完了メールに記載されている購入者のお名前、注文番号を添えて、FlutterKaigi お問い合わせフォームよりご連絡ください。')]),
        ]),

        div(classes: 'cards-grid', [
          _buildCard('📄 ドキュメント', [
            p([text('日本語で書かれた以下のドキュメントをご覧いただけます。')]),
            _docLink('行動規範', 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'),
            _docLink('プライバシーポリシー', 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'),
            _docLink('反社会的勢力排除ポリシー', 'https://docs.flutterkaigi.jp/Exclusion-of-Anti-Social-Forces.ja'),
            _docLink('関連イベントのガイドライン', 'https://docs.flutterkaigi.jp/Event-Guidelines.ja'),
            _docLink('イベント参加規約', 'https://docs.flutterkaigi.jp/Terms-for-Join.ja'),
            _docLink('ロゴ使用ガイドライン', 'https://docs.flutterkaigi.jp/Logo-Guidelines.ja'),
          ]),
          _buildCard('👥 コミュニティに参加する', [
            p([text('FlutterKaigiのコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。なお、FlutterKaigiについては、一般社団法人FlutterKaigiの協力をもって開催されます。')]),
            _socialTile('X', '@FlutterKaigiをフォロー', 'https://x.com/FlutterKaigi', '🐦'),
            _socialTile('GitHub', 'FlutterKaigiリポジトリに貢献する', 'https://github.com/FlutterKaigi', '📂'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _section(String title, List<Component> children) =>
      div(classes: 'info-section', [h3([text(title)]), ...children]);

  Component _sub(String label) => strong(classes: 'sub-label', [text(label)]);

  Component _buildCard(String title, List<Component> children) =>
      div(classes: 'card', [h3([text(title)]), ...children]);

  Component _docLink(String label, String href) =>
      a(href: href, classes: 'doc-link', [text(label), span([text('→')])]);

  Component _socialTile(String title, String sub, String href, String icon) =>
      a(href: href, classes: 'social-tile', [
        div(classes: 'tile-icon', [text(icon)]),
        div([
          strong(classes: 'tile-title', [text(title)]),
          span(classes: 'tile-sub', [text(sub)]),
        ]),
      ]);
}
