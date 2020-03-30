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
                  title: 'IEDCR -1',
                  phoneNumber: '01550064901',
                ),
                ContactCard(
                  title: 'IEDCR - 2',
                  phoneNumber: '01550064905',
                ),
                ContactCard(
                  title: 'IEDCR - 3',
                  phoneNumber: '01401184551',
                ),
                ContactCard(
                  title: 'IEDCR - 4',
                  phoneNumber: '01401184554',
                ),
                ContactCard(
                  title: 'IEDCR - 5',
                  phoneNumber: '01401184559',
                ),
                ContactCard(
                  title: 'IEDCR - 6',
                  phoneNumber: '01401184560',
                ),
                ContactCard(
                  title: 'IEDCR - 7',
                  phoneNumber: '01401184563',
                ),
                ContactCard(
                  title: 'IEDCR - 8',
                  phoneNumber: '01401184568',
                ),
                ContactCard(
                  title: 'IEDCR - 9',
                  phoneNumber: '01927711784',
                ),
                ContactCard(
                  title: 'IEDCR - 10',
                  phoneNumber: '01937000011',
                ),
                ContactCard(
                  title: 'IEDCR - 11',
                  phoneNumber: '01937110011',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
