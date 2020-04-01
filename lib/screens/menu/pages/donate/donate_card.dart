import 'package:flutter/material.dart';
import '../external_links.dart';
import 'package:coronaalert/constants.dart';

class DonateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ExternalLink(
          newsImageURL: 'assets/images/bidyanondologo.png',
          newsPortalName: 'Bidyanondo Foundation',
          urlRedirect: kBidyanondoBkashLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/risingyouthlogo.png',
          newsPortalName: 'Rising Youth Council',
          urlRedirect: kRisingYouthCouncil,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/ekrongalogo.png',
          newsPortalName: 'Ek Ronga Foundation',
          urlRedirect: kEkRonga,
        ),
      ],
    );
  }
}
