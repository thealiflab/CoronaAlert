import 'package:flutter/material.dart';
import '../external_links.dart';
import 'package:coronaalert/constants.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class DonateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ExternalLink(
          newsImageURL: 'assets/images/bidyanondologo.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('dBidyanondo')}",
          urlRedirect: kBidyanondoBkashLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/jaagologo.png',
          newsPortalName: "${AppLocalizations.of(context).translate('dJaago')}",
          urlRedirect: kJaagoFoundation,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/sajidalogo.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('dSajida')}",
          urlRedirect: kSajidaFoundation,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/ekrongalogo.png',
          newsPortalName:
              "${AppLocalizations.of(context).translate('dEkRonga')}",
          urlRedirect: kEkRonga,
        ),
      ],
    );
  }
}
