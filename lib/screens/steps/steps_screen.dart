import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'widgets/step_title.dart';
import 'widgets/step_description.dart';
import '../menu/menu_screen.dart';
import 'package:flutter/services.dart';

class StepsScreen extends StatelessWidget {
  static const id = '/steps_screen';

  final pageList = [
    PageModel(
        title: StepTitle(
          title: 'Wash Your Hands',
        ),
        body: StepDescription(
          description:
              'Regularly you thoroughly clean both sides of your hands, till your wrist, including the underside of your  fingernails by washing them with soap and water for at least 20 seconds.',
        ),
        color: Colors.redAccent,
        heroAssetPath: 'assets/images/washinghands.png',
        iconAssetPath: 'assets/images/washinghands.png'),
    PageModel(
        title: StepTitle(
          title: "Don't Leave Your House",
        ),
        body: StepDescription(
          description:
              'People who are mildly ill with COVID-19 are able to recover at home. So do not leave, except to get medical care. Do not visit public areas. Be sure to get care if you feel worse or you think it is an emergency.',
        ),
        color: Colors.lightBlueAccent,
        heroAssetPath: 'assets/images/house.png',
        iconAssetPath: 'assets/images/house.png'),
    PageModel(
        title: StepTitle(
          title: 'No Hand-Shake',
        ),
        body: StepDescription(
          description:
              'Refrain from shaking hands with or embracing known or unknown people.',
        ),
        color: Colors.deepOrange,
        heroAssetPath: 'assets/images/nohandshake.png',
        iconAssetPath: 'assets/images/nohandshake.png'),
    PageModel(
        title: StepTitle(
          title: 'Cover Your Cough',
        ),
        body: StepDescription(
          description:
              'Cover your nose and mouth when coughing or sneezing with a tissue (or with your bent elbow if no tissue is available',
        ),
        color: Colors.deepPurpleAccent,
        heroAssetPath: 'assets/images/coveryourcough.png',
        iconAssetPath: 'assets/images/coveryourcough.png'),
    PageModel(
        title: StepTitle(
          title: "Don't Touch Your Face",
        ),
        body: StepDescription(
          description:
              'If your hands are not clean, avoid touching your face including eyes, nose and mouth',
        ),
        color: Colors.lightGreen,
        heroAssetPath: 'assets/images/donttouchyourface.png',
        iconAssetPath: 'assets/images/donttouchyourface.png'),
    PageModel(
        title: StepTitle(
          title: 'Protect Yourself',
        ),
        body: StepDescription(
          description:
              "Wear a mask if you're sick. You do not need to wear a facemask unless you are caring for someone who is sick. Facemasks may be in short supply and they should be saved for caregivers",
        ),
        color: Colors.pink,
        heroAssetPath: 'assets/images/protectyourself.png',
        iconAssetPath: 'assets/images/protectyourself.png'),
    PageModel(
        title: StepTitle(
          title: 'Clean and Disinfect',
        ),
        body: StepDescription(
          description:
              'Dispose of the used tissue immediately and clean your hands with soap and water or sanitizers',
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
        doneButtonText: 'Menu',
        skipButtonText: 'Skip',
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
