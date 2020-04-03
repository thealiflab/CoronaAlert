import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class StepTitle extends StatelessWidget {
  final String title;
  StepTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "${AppLocalizations.of(context).translate('sTitle$title')}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
