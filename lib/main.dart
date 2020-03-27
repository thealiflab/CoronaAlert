import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'screens/steps/steps_screen.dart';

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
      },
    );
  }
}
