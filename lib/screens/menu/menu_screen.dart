import 'package:coronaalert/screens/menu/pages/statistics/statistics_page.dart';
import 'package:coronaalert/screens/menu/pages/vtest/vtest_page.dart';
import 'package:coronaalert/screens/steps/steps_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen_widgets/menu_header.dart';
import 'screen_widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/contact/contact_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pages/vtest/vtest_page.dart';
import 'package:coronaalert/constants.dart';
import 'pages/news/news_card.dart';
import 'pages/donate/donate_card.dart';

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
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    MenuCard(
                      title: 'Virtual Test',
                      image: Image.asset(
                        'assets/images/vtest.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(VirtualTest.id);
                      },
                      cardShadow: 9.0,
                    ),
                    MenuCard(
                      title: 'Rules',
                      image: Image.asset(
                        'assets/images/rules.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StepsScreen.id);
                      },
                      cardShadow: 9.0,
                    ),
                    MenuCard(
                      title: 'Contact',
                      image: Image.asset(
                        'assets/images/contact.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(ContactPage.id);
                      },
                      cardShadow: 9.0,
                    ),
                    MenuCard(
                      title: 'Statistics',
                      image: Image.asset(
                        'assets/images/statistics.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StatisticsPage.id);
                      },
                      cardShadow: 9.0,
                    ),
                    MenuCard(
                      title: 'News',
                      image: Image.asset(
                        'assets/images/news.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.none,
                          title: '',
                          content: NewsCard(),
                          closeFunction: () {},
                        ).show();
                      },
                      cardShadow: 5.0,
                    ),
                    MenuCard(
                      title: 'Donate',
                      image: Image.asset(
                        'assets/images/donate.png',
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.none,
                          title: '',
                          content: DonateCard(),
                          closeFunction: () {},
                        ).show();
                      },
                      cardShadow: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Center(
                child: Text(
                  'Developed by Alif',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: () async {
                if (await canLaunch(kMyWebSiteURL)) {
                  await launch(kMyWebSiteURL);
                } else {
                  throw 'Could not Launch $kMyWebSiteURL';
                }
              },
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
