import 'package:bawabetdamascus/core/localization/l10n/app_localization.dart';
import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
