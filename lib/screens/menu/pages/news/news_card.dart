import 'package:flutter/material.dart';
import '../external_links.dart';
import 'package:coronaalert/constants.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ExternalLink(
          newsImageURL: 'assets/images/bbc.png',
          newsPortalName: "${AppLocalizations.of(context).translate('nBBC')}",
          urlRedirect: kBBCLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/cnn.png',
          newsPortalName: "${AppLocalizations.of(context).translate('nCNN')}",
          urlRedirect: kCNNlink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/guardian.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('nGuardian')}",
          urlRedirect: kGuardianLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/prothomalo.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('nProthomAlo')}",
          urlRedirect: kProthomAloLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/dailystar.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('nDailyStar')}",
          urlRedirect: kDSLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/whologo.png',
          newsPortalName: "${AppLocalizations.of(context).translate('nWHO')}",
          urlRedirect: kWHOBD,
        ),
      ],
    );
  }
}
