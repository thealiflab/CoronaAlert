import 'package:flutter/material.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class StepDescription extends StatelessWidget {
  final String description;

  StepDescription({this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        "${AppLocalizations.of(context).translate('sDesc$description')}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
