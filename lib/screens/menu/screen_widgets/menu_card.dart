import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final Widget image;
  final Function onPressed;
  final double cardShadow;

  MenuCard({
    this.title,
    this.image,
    @required this.onPressed,
    this.cardShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.grey[600],
        child: Card(
          margin: EdgeInsets.all(10.0),
          elevation: cardShadow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 140,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: image,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
