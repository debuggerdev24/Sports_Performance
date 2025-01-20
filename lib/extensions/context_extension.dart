import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get translator => AppLocalizations.of(this)!;
}