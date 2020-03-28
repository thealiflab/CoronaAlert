import 'package:flutter/material.dart';

class VirtualTest extends StatefulWidget {
  static const id = '/vtest_page';

  @override
  _VirtualTestState createState() => _VirtualTestState();
}

class _VirtualTestState extends State<VirtualTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Test'),
      ),
      body: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/vtest.png',
                      height: 250,
                      fit: BoxFit.contain,
                      //MediaQuery.of(context).size.width / 2
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Take the Test',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
