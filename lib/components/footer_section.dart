import 'package:associate_site/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/link.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(height: 24),
        Center(
          child: Wrap(
            spacing: 24,
            children: <Widget>[
              ...links
                  .map(
                    (link) => SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: Center(
                        child: Card(
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Link(
                            uri: Uri.parse(link[1]),
                            target: LinkTarget.blank,
                            builder:
                                (context, followLink) => IconButton(
                                  tooltip: '${link[0]}を開く',
                                  onPressed: followLink,
                                  icon: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                    icon: SvgPicture.asset(
                                      'assets/${link[0]}_logo.svg',
                                      semanticsLabel: '${link[0]} Logo',
                                    ),
                                    color: const Color(0xFF162A49),
                                    onPressed: () {},
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Copyright ©2021-2025, All Rights Reserved.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
            color: Color(0xFF162A49),
          ),
        ),
        const Text(
          'Powered by $title',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
            color: Color(0xFF162A49),
          ),
        ),
      ],
    );
  }
}
