import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'widgets/step_title.dart';
import 'widgets/step_description.dart';
import 'package:flutter/services.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class StepsScreen extends StatelessWidget {
  static const id = '/steps_screen';

  final pageList = [
    PageModel(
        title: StepTitle(
          title: 'WashYourHands',
        ),
        body: StepDescription(
          description: 'WashYourHands',
        ),
        color: Colors.redAccent,
        heroAssetPath: 'assets/images/washinghands.png',
        iconAssetPath: 'assets/images/washinghands.png'),
    PageModel(
        title: StepTitle(
          title: "DontLeaveYourHouse",
        ),
        body: StepDescription(
          description: 'DontLeaveYourHouse',
        ),
        color: Colors.lightBlueAccent,
        heroAssetPath: 'assets/images/house.png',
        iconAssetPath: 'assets/images/house.png'),
    PageModel(
        title: StepTitle(
          title: 'NoHandShake',
        ),
        body: StepDescription(
          description: 'NoHandShake',
        ),
        color: Colors.deepOrange,
        heroAssetPath: 'assets/images/nohandshake.png',
        iconAssetPath: 'assets/images/nohandshake.png'),
    PageModel(
        title: StepTitle(
          title: 'CoverYourCough',
        ),
        body: StepDescription(
          description: 'CoverYourCough',
        ),
        color: Colors.deepPurpleAccent,
        heroAssetPath: 'assets/images/coveryourcough.png',
        iconAssetPath: 'assets/images/coveryourcough.png'),
    PageModel(
        title: StepTitle(
          title: "DontTouchYourFace",
        ),
        body: StepDescription(
          description: 'DontTouchYourFace',
        ),
        color: Colors.lightGreen,
        heroAssetPath: 'assets/images/donttouchyourface.png',
        iconAssetPath: 'assets/images/donttouchyourface.png'),
    PageModel(
        title: StepTitle(
          title: 'ProtectYourself',
        ),
        body: StepDescription(
          description: 'ProtectYourself',
        ),
        color: Colors.pink,
        heroAssetPath: 'assets/images/protectyourself.png',
        iconAssetPath: 'assets/images/protectyourself.png'),
    PageModel(
        title: StepTitle(
          title: 'CleanandDisinfect',
        ),
        body: StepDescription(
          description: 'CleanandDisinfect',
        ),
        color: Colors.teal,
        heroAssetPath: 'assets/images/dustbin.png',
        iconAssetPath: 'assets/images/dustbin.png'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: FancyOnBoarding(
        showSkipButton: true,
        doneButtonText: "${AppLocalizations.of(context).translate('sMenu')}",
        skipButtonText: "${AppLocalizations.of(context).translate('sSkip')}",
        pageList: pageList,
        onDoneButtonPressed: () {
          Navigator.of(context).pushNamed(MenuScreen.id);
        },
        onSkipButtonPressed: () {
          Navigator.of(context).pushNamed(MenuScreen.id);
        },
      ),
    );
  }
}
