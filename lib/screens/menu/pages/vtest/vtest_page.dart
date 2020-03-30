import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'vtest_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VirtualTest extends StatefulWidget {
  static const id = '/vtest_page';

  @override
  _VirtualTestState createState() => _VirtualTestState();
}

VTestBrain vTestBrain = VTestBrain();

class _VirtualTestState extends State<VirtualTest> {
  int questionValueKeeper = 0;
  int quesNo = 1;

  void checkAnswers(bool userSelectAnswer) {
    setState(() {
      if (vTestBrain.isFinished() == true) {
        vTestBrain.reset();
        quesNo = 1;

        Alert(
          context: context,
          type: AlertType.info,
          title: "Your Result",
          desc: vTestBrain.vTestResult(questionValueKeeper),
          closeFunction: () {
            questionValueKeeper = 0;
          },
          buttons: [
            DialogButton(
              child: Text(
                "Re-Test",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                questionValueKeeper = 0;
                Navigator.pop(context);
              },
              width: 120,
            ),
            DialogButton(
              child: Text(
                "CANCLE",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(MenuScreen.id);
              },
              width: 120,
            ),
          ],
        ).show();
        questionValueKeeper = 0;
      } else {
        vTestBrain.nextQuestion();
        quesNo++;
        if (userSelectAnswer) {
          questionValueKeeper += vTestBrain.getQuestionValue();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual Test'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            'assets/images/' + vTestBrain.getQuestionImagePath() + '.png',
            height: 250,
            fit: BoxFit.contain,
            //MediaQuery.of(context).size.width / 2
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Take the Test: $quesNo/10',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                vTestBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 60,
                left: 60,
                right: 60,
                bottom: 0,
              ),
              child: FlatButton(
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                textColor: Colors.white,
                color: Color(0xFF52de97),
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  checkAnswers(false);
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: 60,
                right: 60,
                bottom: 60,
              ),
              child: FlatButton(
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  checkAnswers(true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
