import 'package:coronaalert/screens/menu/pages/contact/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:coronaalert/localization/app_localizations.dart';

class ContactPage extends StatelessWidget {
  static const id = '/contact_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppLocalizations.of(context).translate('cTitle')}",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/contactdoctor.png',
                      height: 110,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${AppLocalizations.of(context).translate('cHot')}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              children: <Widget>[
                ContactCard(
                  title:
                      "${AppLocalizations.of(context).translate('cEmergency')}",
                  phoneNumber: '333',
                ),
                ContactCard(
                  title:
                      "${AppLocalizations.of(context).translate('cEmergency')}",
                  phoneNumber: '10655',
                ),
                ContactCard(
                  title:
                      "${AppLocalizations.of(context).translate('cEmergency')}",
                  phoneNumber: '16263',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01550064901',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01550064905',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184551',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184554',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184559',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184560',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184563',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01401184568',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01927711784',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01937000011',
                ),
                ContactCard(
                  title: "${AppLocalizations.of(context).translate('cIEDCR')}",
                  phoneNumber: '01937110011',
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
