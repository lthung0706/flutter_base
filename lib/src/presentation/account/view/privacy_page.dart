import 'package:flutter/material.dart';
import 'package:app_intl/ez_intl.dart';
import '../../../components/markdown_viewer.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.privacyPolicy)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: MarkdownViewer(
            data: context.l10n.privacyPolicyMarkdown,
            selectable: true,
          ),
        ),
      ),
    );
  }
}
