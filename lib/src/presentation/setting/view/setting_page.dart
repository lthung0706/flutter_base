import 'package:app_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/src/routes/routes.dart';
import '../widgets/setting_body.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appSettings),
      ),
      body: SettingBody(
        onOpenBilling: () => context.push(Routes.billing),
      ),
    );
  }
}
