import 'package:bawabetdamascus/core/constants/app_colors.dart';
import 'package:bawabetdamascus/domain/providers/language_provider.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void showLanguageBottomSheet(BuildContext context) async {
  final langProvider = Provider.of<LanguageProvider>(context, listen: false);
  String selectedLang = langProvider.currentLocale.languageCode;

  await showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    clipBehavior: Clip.antiAlias,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.change_language,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  AppLocalizations.of(context)!.choose_language,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const Divider(),
                ...['en', 'ar', 'fr'].map((code) {
                  String title = code == 'en' ? 'English' : code == 'ar' ? 'العربية' : 'Français';
                  return RadioListTile<String>(
                    title: Text(title),
                    value: code,
                    groupValue: selectedLang,
                    onChanged: (value) {
                      setState(() => selectedLang = value!);
                      langProvider.changeLanguage(value.toString());
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              ],
            ),
          );
        },
      );
    },
  );
}
