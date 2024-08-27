import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaizenkode_test/core/routes_manager.dart';
import 'package:kaizenkode_test/core/theme.dart';
import '../i18n/strings.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return CupertinoApp.router(
     debugShowCheckedModeBanner: false,
      title: 'Kaizenkode test',
     locale: TranslationProvider.of(context).flutterLocale, // use provider
     supportedLocales: AppLocaleUtils.supportedLocales,
     localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: lightTheme(),
     routerConfig: AppRouter.router,
    );
  }
}
