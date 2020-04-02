import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  final Icon stateCardIcon;
  final String textNumber;
  final String catagoryName;

  StateCard({
    @required this.stateCardIcon,
    @required this.textNumber,
    @required this.catagoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Card(
          color: Colors.white,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                stateCardIcon,
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  textNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  catagoryName,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
