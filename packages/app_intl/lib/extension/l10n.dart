// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
