import 'package:associate_site/constants/links.dart';

/// 電子公告として掲出する貸借対照表。新しい年度が上に来るよう降順で持つ。
///
/// 年度を追加するときはこのリストの先頭に足す。
const balanceSheets = <LinkItem>[
  LinkItem(
    label: '2025年度(令和7年度)貸借対照表',
    href: 'https://drive.google.com/file/d/1T6cHwex1rjlLvs3Zhx3vA-_kxtAwyc_b/view?usp=sharing',
  ),
  LinkItem(
    label: '2024年度(令和6年度)貸借対照表',
    href: 'https://drive.google.com/file/d/1hKGPkBDZ5224OMVJrYeTyMwx0MQvv88K/view?usp=sharing',
  ),
  LinkItem(
    label: '2023年度(令和5年度)貸借対照表',
    href: 'https://drive.google.com/file/d/1bNfLuma7ZMzeX_wOzu5GCvfG8RMASXXD/view?usp=sharing',
  ),
  LinkItem(
    label: '2022年度(令和4年度)貸借対照表',
    href: 'https://drive.google.com/file/d/178O_RqmSR-qdaSGbv9RN6IoEuM7I6If8/view?usp=sharing',
  ),
];
