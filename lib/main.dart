import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/pages/landing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_breakfast_app/settings/inapp_lang_config.dart';

// the app is adapted from and developed by -> Please read readme file
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Locale myLocale = Localizations.localeOf(context);
    // l.overrideDefaultLocale(myLocale);
    return MaterialApp(
      title: "Breakfast App",
      theme: ThemeData(fontFamily: 'Thasadith'),
      home: const Landing(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: langConfig.getAvailableLocales(),
      locale: langConfig.language ?? langConfig.deviceDefaultLocale,
      localeResolutionCallback: (
        locale,
        supportedLocales,
      ) {
        return locale;
      },
    );
  }
}
