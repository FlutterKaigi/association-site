import 'package:associate_site/models/info_model.dart';

const title = '一般社団法人FlutterKaigi';
const enTitle = 'FlutterKaigi Association';

final List<Info> info = [
  Info(label: '名称', text: '$title / $enTitle'),
  Info(label: '主たる事務所', text: '東京都渋谷区渋谷2-19-15宮益坂ビルディング609'),
  Info(label: '法人の公告方法', text: '当法人の公告は、電子公告により行う'),
  Info(
    label: '目的等',
    text: '目的 当法人は、エンジニアの技術共有およびコミュニケーションを支援、充実することを目的とし、その目的に資するため、次の事業を行う',
  ),
];

final notices = [
  [
    '2023年度(令和5年度)貸借対照表',
    'https://drive.google.com/file/d/178O_RqmSR-qdaSGbv9RN6IoEuM7I6If8/view?usp=drive_link',
  ],
  [
    '2024年度(令和6年度)貸借対照表',
    'https://drive.google.com/file/d/1bNfLuma7ZMzeX_wOzu5GCvfG8RMASXXD/view?usp=drive_link',
  ],
];

final purposes = [
  'エンジニアを対象とした催しの開催、また運営',
  'エンジニアの育成の推進を図る活動',
  '技術共有、コミュニケーションを目的とした催しの支援および人材育成',
  '前各号に附帯又は関連する事業',
];
