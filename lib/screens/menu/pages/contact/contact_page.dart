import 'package:coronaalert/screens/menu/pages/contact/contact_card.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  static const id = '/contact_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact',
        ),
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
                      height: 150,
                      fit: BoxFit.contain,
                      //MediaQuery.of(context).size.width / 2
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contact List',
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
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ContactCard(
                  title: 'Emergency',
                  phoneNumber: '999',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
                ContactCard(
                  title: 'Me',
                  phoneNumber: '01790140470',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
