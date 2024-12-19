import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class TextLinkButton extends StatelessWidget {
  const TextLinkButton({super.key, required this.name, required this.href});

  final String name;
  final String href;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(href),
      target: LinkTarget.blank,
      builder:
          (context, followLink) => IconButton(
            tooltip: name,
            onPressed: followLink,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Container(
              height: 30,
              width: 144,
              color: Colors.red,
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
