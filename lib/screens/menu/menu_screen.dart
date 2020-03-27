import 'package:coronaalert/screens/steps/steps_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/menu_header.dart';
import 'widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';

const kMyWebSiteURL = 'https://ahmedalif.com';

class MenuScreen extends StatelessWidget {
  static const id = 'menu_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            MenuHeader(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    MenuCard(
                      title: 'Virtual Test',
                      image: Image.asset(
                        'assets/images/test.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                    MenuCard(
                      title: 'Rules',
                      image: Image.asset(
                        'assets/images/rules.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                    MenuCard(
                      title: 'News',
                      image: Image.asset(
                        'assets/images/news.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                    MenuCard(
                      title: 'Statistics',
                      image: Image.asset(
                        'assets/images/statistics.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                    MenuCard(
                      title: 'Contact',
                      image: Image.asset(
                        'assets/images/contact.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                    MenuCard(
                      title: 'Donate',
                      image: Image.asset(
                        'assets/images/donate.png',
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: InkWell(
                child: Text(
                  'Developed by Alif',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () async {
                  if (await canLaunch(kMyWebSiteURL)) {
                    await launch(kMyWebSiteURL);
                  } else {
                    throw 'Could not launch $kMyWebSiteURL';
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
