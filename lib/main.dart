import 'package:bawabetdamascus/core/utils/shared_pref_controller.dart';
import 'package:bawabetdamascus/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/theme/light_theme.dart';
import 'core/theme/dark_theme.dart';
import 'domain/providers/theme_provider.dart';
import 'domain/providers/language_provider.dart';
import 'domain/providers/settings_provider.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController.instance.initPref();
  runApp(const BawabetDamascusApp());
}

class BawabetDamascusApp extends StatelessWidget {
  const BawabetDamascusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final langProvider = Provider.of<LanguageProvider>(context);

          return MaterialApp(
            title: 'Bawabet Damascus',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.isDark ? getDarkTheme() : getLightTheme(),
            locale: langProvider.currentLocale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: AppRoutes.launch,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }
}
