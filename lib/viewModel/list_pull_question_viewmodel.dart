import 'dart:developer';
import 'package:sample_flutter_web_app/enums/viewstate.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/services/api.dart';
import 'package:sample_flutter_web_app/viewModel/base_viewmodel.dart';

class ListPullQuestionViewModel extends BaseViewModel {
  Api _api = Api();

  QuestionState questionState;

  int _index = 0;

  Future fetchQuestions(String phone) async {
    setState(ViewState.Busy);
    questionState = await _api.fetchQuestions(phone);
    setState(ViewState.Idle);
  }


  Future postAnswer(String phone,int label,int answer) async {
    setState(ViewState.Busy);
    final data = await _api.postAnswer(phone,label,answer);
    setState(ViewState.Idle);
    nextQuestion();
  }


  bool changeActionNextQuestion = false;

  Question get currentQuestion {
    if (_index < 0) return null;
    return questionState.data[_index];
  }

  void nextQuestion() {
    if (questionState.data != null) {
      if (_index < questionState.data.length - 1) {
        _index++;
        log('index=$_index');
      } else {
        log('index=$_index');
        changeActionNextQuestion = true;
      }
      notifyListeners();
    }
  }

  void updateOptionState(String phone,int id) {
    if (currentQuestion != null) {
      if (currentQuestion.answerModels.isNotEmpty &&
          id < currentQuestion.answerModels.length) {
        currentQuestion.answerModels[id].state = OptionState.correct;
        postAnswer(phone, currentQuestion.number, id+1);
      }
    }
  }
}
