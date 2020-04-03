import 'package:coronaalert/screens/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'vtest_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../localization/app_localizations.dart';

class VirtualTest extends StatefulWidget {
  static const id = '/vtest_page';

  @override
  _VirtualTestState createState() => _VirtualTestState();
}

VTestBrain vTestBrain = VTestBrain();

class _VirtualTestState extends State<VirtualTest> {
  int questionValueKeeper = 0;
  String _testResultText;
  int quesNo = 1;

  void checkAnswers(bool userSelectAnswer) {
    setState(() {
      if (vTestBrain.isFinished() == true) {
        vTestBrain.reset();
        quesNo = 1;
        _testResultText = vTestBrain.vTestResult(questionValueKeeper);

        Alert(
          context: context,
          type: AlertType.info,
          title: "${AppLocalizations.of(context).translate('vAlertHeader')}",
          desc:
              "${AppLocalizations.of(context).translate('v$_testResultText')}",
          closeFunction: () {
            questionValueKeeper = 0;
          },
          buttons: [
            DialogButton(
              child: Text(
                "${AppLocalizations.of(context).translate('vReTestButton')}",
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
                "${AppLocalizations.of(context).translate('vCancelButton')}",
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
        title: Text('${AppLocalizations.of(context).translate('vTestTitle')}'),
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            vTestBrain.reset();
            _testResultText = vTestBrain.vTestResult(questionValueKeeper);
            questionValueKeeper = 0;
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          Image.asset(
            'assets/images/' + vTestBrain.getQuestionImagePath() + '.png',
            height: 150,
            width: 150,
            fit: BoxFit.contain,
            //MediaQuery.of(context).size.width / 2
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '${AppLocalizations.of(context).translate('vTestHeader')}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(35),
                child: Text(
                  AppLocalizations.of(context).translate("vQ$quesNo"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 27.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: 60,
                right: 60,
                bottom: 0,
              ),
              child: FlatButton(
                padding: EdgeInsets.all(18),
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                textColor: Colors.white,
                color: Colors.redAccent,
                child: Text(
                  AppLocalizations.of(context).translate('vButtonNo'),
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
            height: 15.0,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 0,
                left: 60,
                right: 60,
                bottom: 30,
              ),
              child: FlatButton(
                padding: EdgeInsets.all(18),
                splashColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                textColor: Colors.white,
                color: Color(0xFF52de97),
                child: Text(
                  AppLocalizations.of(context).translate('vButtonYes'),
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
