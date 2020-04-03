import 'package:flutter/material.dart';
import '../../../localization/app_localizations.dart';

class MenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('menuHeader'),
            style: TextStyle(
              fontSize: 30.0,
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
