import 'questions.dart';

int _questionNumber = 0;

class VTestBrain {
  List<Questions> _questionBank = [
    Questions('Do you have dry cough?', 2, 'drycough'),
    Questions('Do you have fever? (Temperature above 38 degree)', 2, 'fever'),
    Questions('Are you having diarrhea?', 1, 'diarrhea'),
    Questions('Are you experiencing tiredness?', 1, 'tiredness'),
    Questions('Do you feel confused recently?', 1, 'confused'),
    Questions('Are you having pain in your throat?', 2, 'throat'),
    Questions('Are you experiencing difficulty to take breath?', 3,
        'protectyourself'),
    Questions(
        'Have you traveled recently during the last 15-20 days?', 3, 'travel'),
    Questions('Do you have any nearby physical contact with COVID-19 patient?',
        4, 'physical'),
    Questions(
        'Have you visited Corona infected area recently?', 4, 'statecoronamap'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
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
    String message;
    if (value >= 0 && value <= 4) {
      message = "NO RISK of having Corona virus. You are safe 😇";
    } else if (value >= 5 && value <= 7) {
      message =
          "MEDIUM Risk of having Corona virus. Drink enough water and maintain good hygiene! 😓";
    } else if (value > 7) {
      message =
          "HIGH Risk of having Corona virus. Please immediately admit into the hospital 🏥 😱";
    } else {
      message = "Invalid Result";
    }
    return message;
  }
}
