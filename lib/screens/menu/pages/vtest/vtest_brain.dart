import 'questions.dart';

int _questionNumber = 0;

class VTestBrain {
  List<Questions> _questionBank = [
    Questions(2, 'drycough'),
    Questions(2, 'fever'),
    Questions(1, 'diarrhea'),
    Questions(1, 'tiredness'),
    Questions(1, 'confused'),
    Questions(2, 'throat'),
    Questions(3, 'protectyourself'),
    Questions(3, 'travel'),
    Questions(4, 'physical'),
    Questions(4, 'statecoronamap'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionValue() {
    return _questionBank[_questionNumber].questionValue;
  }

  String getQuestionImagePath() {
    return _questionBank[_questionNumber].questionImagePath;
  }

  bool isFinished() {
    if (_questionBank.length - 1 == _questionNumber) {
      return true;
    }
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }

  String vTestResult(int value) {
    String _message;
    if (value >= 0 && value <= 4) {
      _message = "NoRisk";
    } else if (value >= 5 && value <= 7) {
      _message = "MediumRisk";
    } else if (value > 7) {
      _message = "HighRisk";
    } else {
      _message = "Invalid";
    }
    return _message;
  }
}
