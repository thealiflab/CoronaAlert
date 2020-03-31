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
import 'pages/news/news_link.dart';
import 'pages/vtest/vtest_page.dart';
import 'package:coronaalert/constants.dart';

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
//                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(VirtualTest.id);
                      },
                    ),
                    MenuCard(
                      title: 'Rules',
                      image: Image.asset(
                        'assets/images/rules.png',
//                        height: 80,
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
//                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        onPressed: () {
                          Alert(
                            context: context,
                            type: AlertType.none,
                            title: '',
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                NewsLink(
                                  newsImageURL: 'assets/images/bbc.png',
                                  newsPortalName: 'BBC',
                                  urlRedirect: kBBCLink,
                                ),
                                NewsLink(
                                  newsImageURL: 'assets/images/cnn.png',
                                  newsPortalName: 'CNN',
                                  urlRedirect: kCNNlink,
                                ),
                                NewsLink(
                                  newsImageURL: 'assets/images/guardian.png',
                                  newsPortalName: 'Guardian',
                                  urlRedirect: kGuardianLink,
                                ),
                                NewsLink(
                                  newsImageURL: 'assets/images/prothomalo.png',
                                  newsPortalName: 'Prothom-Alo',
                                  urlRedirect: kProthomAloLink,
                                ),
                                NewsLink(
                                  newsImageURL: 'assets/images/dailystar.png',
                                  newsPortalName: 'The Daily Star',
                                  urlRedirect: kDSLink,
                                ),
                              ],
                            ),
                            closeFunction: () {},
                          ).show();
                        }),
                    MenuCard(
                      title: 'Statistics',
                      image: Image.asset(
                        'assets/images/statistics.png',
//                        height: 50,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(StatisticsPage.id);
                      },
                    ),
                    MenuCard(
                      title: 'Contact',
                      image: Image.asset(
                        'assets/images/contact.png',
//                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(ContactPage.id);
                      },
                    ),
                    MenuCard(
                      title: 'Donate',
                      image: Image.asset(
                        'assets/images/donate.png',
//                        height: 80,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () async {
                        if (await canLaunch(kBkashDonateLink)) {
                          await launch(kBkashDonateLink);
                        } else {
                          throw "Couldn't Launch $kBkashDonateLink";
                        }
                      },
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

//() async {
//if (await canLaunch(kNewsLink)) {
//await launch(kNewsLink);
//} else {
//throw 'Could not launch $kNewsLink';
//}
//},
