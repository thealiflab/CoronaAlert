import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLink extends StatelessWidget {
  final String newsImageURL;
  final String newsPortalName;
  final String urlRedirect;

  ExternalLink(
      {this.newsImageURL, this.newsPortalName, @required this.urlRedirect});

  _gotoWeb(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _gotoWeb(urlRedirect),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              newsImageURL,
              fit: BoxFit.contain,
              height: 40,
              width: 40,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              newsPortalName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
