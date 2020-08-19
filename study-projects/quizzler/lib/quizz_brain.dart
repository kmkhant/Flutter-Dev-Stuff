import 'package:quizzler/question.dart';

class QuizzBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question("Khaing Myel Khant ka chaw lr?", true),
    Question("noob Lar ?", true),
    Question("chit sa yar lay lr ?", true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    // print(_questionNumber);
    if (_questionNumber >= _questionBank.length) {
      // print("Finished");
      return true;
    }
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
