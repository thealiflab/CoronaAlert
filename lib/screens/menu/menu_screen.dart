import 'package:coronaalert/screens/menu/pages/statistics/statistics_page.dart';
import 'package:coronaalert/screens/menu/pages/vtest/vtest_page.dart';
import 'package:coronaalert/screens/steps/steps_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screen_widgets/menu_header.dart';
import 'screen_widgets/menu_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/contact/contact_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'pages/vtest/vtest_page.dart';
import 'package:coronaalert/constants.dart';
import 'pages/news/news_card.dart';
import 'pages/donate/donate_card.dart';
import '../../localization/app_localizations.dart';
import '../../localization/app_language.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  static const id = 'menu_screen';

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool switchValue = true;

  onSwitchValueChanged(bool newValue) {
    setState(() {
      switchValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
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
                      title:
                          AppLocalizations.of(context).translate('menuCard1'),
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
                      title:
                          AppLocalizations.of(context).translate('menuCard2'),
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
                      title:
                          AppLocalizations.of(context).translate('menuCard3'),
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
                      title:
                          AppLocalizations.of(context).translate('menuCard4'),
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
                      title:
                          AppLocalizations.of(context).translate('menuCard5'),
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
                      title:
                          AppLocalizations.of(context).translate('menuCard6'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.globeAmericas,
                  color: Colors.cyan,
                  size: 20,
                ),
                Switch(
                  value: switchValue,
                  onChanged: (newValue) {
                    onSwitchValueChanged(newValue);
                    if (newValue) {
                      appLanguage.changeLanguage(Locale("bn"));
                    } else {
                      appLanguage.changeLanguage(Locale("en"));
                    }
                  },
                  activeColor: Colors.cyan,
                ),
              ],
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
