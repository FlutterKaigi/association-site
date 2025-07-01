import 'package:associate_site/components/footer_section.dart';
import 'package:associate_site/components/text_link_button.dart';
import 'package:associate_site/components/title_section.dart';
import 'package:associate_site/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.deepPurple[50],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Gap(32),
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/flutterkaigi_icon.png'),
                ),
                ...info.map((i) {
                  return TitleSection(
                    name: i.label,
                    children: [
                      Text(i.text, style: TextStyle(color: Colors.grey[500])),
                      (i.label == '法人の公告方法' ||
                              i.label == '目的等' ||
                              i.label == 'ポリシー類')
                          ? const Gap(32)
                          : const SizedBox(),
                      ...i.label == '法人の公告方法'
                          ? notices
                              .map(
                                (n) => Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          n[0],
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                        TextLinkButton(
                                          name: 'PDF を開く',
                                          href: n[1],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              .toList()
                          : [const SizedBox()],
                      ...i.label == '目的等'
                          ? purposes
                              .map(
                                (p) => Text(
                                  p,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                              )
                              .toList()
                          : [const SizedBox()],
                    ],
                  );
                }).toList(),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 800) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildDocumentsCard(context)),
                          const SizedBox(width: 24),
                          Expanded(child: _buildCommunityCard()),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _buildDocumentsCard(context),
                          const SizedBox(height: 24),
                          _buildCommunityCard(),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 60),
                const FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentsCard(BuildContext context) {
    return SizedBox(
      height: 440,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.description, color: Colors.blue.shade500),
                  const SizedBox(width: 12),
                  const Text(
                    'ドキュメント',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '日本語で書かれた以下のドキュメントをご覧いただけます。',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              ...policies
                  .map(
                    (p) => _buildDocumentLink(
                      context,
                      p[1],
                      p[0],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentLink(BuildContext context, String slug, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Link(
        uri: Uri.parse(slug),
        target: LinkTarget.blank,
        builder: (context, followLink) => IconButton(
          tooltip: title,
          onPressed: followLink,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 16,
                color: Colors.blue.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityCard() {
    return SizedBox(
      height: 440,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.people, color: Colors.blue.shade500),
                  const SizedBox(width: 12),
                  const Text(
                    'コミュニティに参加する',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'FlutterKaigiコミュニティに参加して、最新情報を入手したり、他の開発者と交流したりしましょう。',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              _buildSocialLink(
                icon: Icons.flutter_dash,
                title: 'Twitter',
                subtitle: '@FlutterKaigiをフォロー',
                url: 'https://twitter.com/FlutterKaigi',
              ),
              const SizedBox(height: 16),
              _buildSocialLink(
                icon: Icons.code,
                title: 'GitHub',
                subtitle: 'FlutterKaigiリポジトリに貢献する',
                url: 'https://github.com/FlutterKaigi',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) {
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank,
      builder: (context, followLink) => IconButton(
        tooltip: title,
        onPressed: followLink,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        icon: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
