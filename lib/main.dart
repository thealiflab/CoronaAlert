import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:coronaalert/screens/menu/pages/contact/contact_page.dart';
import 'package:coronaalert/screens/menu/pages/statistics/statistics_page.dart';
import 'package:coronaalert/screens/menu/pages/vtest/vtest_page.dart';
import 'package:flutter/material.dart';
import 'screens/steps/steps_screen.dart';
import 'screens/menu/pages/statistics/country/countries_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localizations.dart';
import 'localization/app_language.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(
    MyApp(
      appLanguage: appLanguage,
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Corona Alert App',
            theme: ThemeData(
              primaryColor: Colors.redAccent,
              accentColor: Colors.white,
              fontFamily: 'PTSans',
            ),
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
              Locale('bn', 'BD'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: MenuScreen.id,
            routes: {
              MenuScreen.id: (context) => MenuScreen(),
              StepsScreen.id: (context) => StepsScreen(),
              ContactPage.id: (context) => ContactPage(),
              VirtualTest.id: (context) => VirtualTest(),
              StatisticsPage.id: (context) => StatisticsPage(),
              CountriesPage.id: (context) => CountriesPage(),
            },
          );
        },
      ),
      create: (_) => appLanguage,
    );
  }
}
