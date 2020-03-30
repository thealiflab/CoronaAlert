import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:coronaalert/screens/menu/pages/contact/contact_page.dart';
import 'package:coronaalert/screens/menu/pages/statistics/statistics_page.dart';
import 'package:coronaalert/screens/menu/pages/vtest/vtest_page.dart';
import 'package:flutter/material.dart';
import 'screens/steps/steps_screen.dart';
import 'screens/menu/pages/statistics/country/countries_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Alert App',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        accentColor: Colors.white,
        fontFamily: 'PTSans',
      ),
      initialRoute: StepsScreen.id,
      routes: {
        StepsScreen.id: (context) => StepsScreen(),
        MenuScreen.id: (context) => MenuScreen(),
        ContactPage.id: (context) => ContactPage(),
        VirtualTest.id: (context) => VirtualTest(),
        StatisticsPage.id: (context) => StatisticsPage(),
        CountriesPage.id: (context) => CountriesPage(),
      },
    );
  }
}
