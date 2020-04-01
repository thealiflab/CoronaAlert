import 'package:flutter/material.dart';
import '../external_links.dart';
import 'package:coronaalert/constants.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ExternalLink(
          newsImageURL: 'assets/images/bbc.png',
          newsPortalName: 'BBC',
          urlRedirect: kBBCLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/cnn.png',
          newsPortalName: 'CNN',
          urlRedirect: kCNNlink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/guardian.png',
          newsPortalName: 'Guardian',
          urlRedirect: kGuardianLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/prothomalo.png',
          newsPortalName: 'Prothom-Alo',
          urlRedirect: kProthomAloLink,
        ),
        ExternalLink(
          newsImageURL: 'assets/images/dailystar.png',
          newsPortalName: 'The Daily Star',
          urlRedirect: kDSLink,
        ),
      ],
    );
  }
}
