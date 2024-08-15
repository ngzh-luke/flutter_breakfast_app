import 'package:flutter/material.dart';
import 'package:flutter_breakfast_app/app_info.dart';
import 'package:flutter_breakfast_app/pages/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_breakfast_app/settings/inapp_lang_config.dart';
import 'package:flutter_breakfast_app/main.dart';
// import 'package:language_code/language_code.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  AppBar myAppBar() {
    return AppBar(
      // title: Text("Welcome!"),
      title: const Padding(
        padding: EdgeInsets.all(10.0),
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 200,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Locale myLocale = langConfig.getCurrentLangLocale();
    String myLocaleLangStr = "Language code: $myLocale";
    final version = info.getVersion();
    final name = " | App name: ${info.getAppName()}";
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome, // welcome
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: Container(
                width: 105,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Start',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 179, 75, 68),
                      fontWeight: FontWeight.w900),
                )),
              ),
            ),
            // const Spacer(),
            const SizedBox(),
            const AvailableLanguageSelector(),
          ],
        )),
        bottomNavigationBar: SizedBox(
            child: BottomAppBar(
                child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Version: $version | "),
            Text(myLocaleLangStr),
            Text(name)
          ],
        ))),
      ),
    );
  }
}

class AvailableLanguageSelector extends StatefulWidget {
  const AvailableLanguageSelector({super.key});

  @override
  State<AvailableLanguageSelector> createState() =>
      _AvailableLanguageSelectorState();
}

class _AvailableLanguageSelectorState extends State<AvailableLanguageSelector> {
  final List<Locale> _languages = langConfig.getAvailableLocales();
  late Locale? _language = langConfig.currentLangLocale;

  // Locale _getLangLocale(int index) => _languages[index];
  String _getLangCode(Locale locale) => locale.languageCode;
  String _getRegion(Locale locale) => locale.countryCode ?? '';
  String _getLangName(Locale locale) => _getRegion(locale) == ''
      ? _getLangCode(locale)
      : "${_getLangCode(locale)}_${_getRegion(locale)}";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(_getLangName(_languages[0])),
          leading: Radio<Locale>(
            value: _languages[0],
            groupValue: _language,
            onChanged: (Locale? value) {
              setState(() {
                _language = value;
                langConfig.enableInAppLangConf();
                langConfig.setLang(langCode: _language!.languageCode);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              });
            },
          ),
        ),
        ListTile(
          title: Text(_getLangName(_languages[1])),
          leading: Radio<Locale>(
            value: _languages[1],
            groupValue: _language,
            onChanged: (Locale? value) {
              setState(() {
                _language = value;
                langConfig.enableInAppLangConf();
                langConfig.setLang(langCode: _language!.languageCode);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              });
            },
          ),
        ),
        ListTile(
          title: Text(_getLangName(_languages[2])),
          leading: Radio<Locale>(
            value: _languages[2],
            groupValue: _language,
            onChanged: (Locale? value) {
              setState(() {
                _language = value;
                langConfig.enableInAppLangConf();
                langConfig.setLang(langCode: _language!.languageCode);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              });
            },
          ),
        ),
        ListTile(
          title: Text(_getLangName(_languages[3])),
          leading: Radio<Locale>(
            value: _languages[3],
            groupValue: _language,
            onChanged: (Locale? value) {
              setState(() {
                _language = value;
                langConfig.enableInAppLangConf();
                langConfig.setLang(
                    langCode: _language!.languageCode,
                    regionCode: _getRegion(_language!));

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ));
              });
            },
          ),
        ),
      ],
    );
  }
}
