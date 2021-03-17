import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/enums/viewstate.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/services/api.dart';
import 'package:sample_flutter_web_app/viewModel/base_viewmodel.dart';

class ListQuestionViewModel extends BaseViewModel {
  Api _api = Api();

  QuestionState questionState;

  int _index = 0;

  Future fetchQuestions(String phone) async {
    setState(ViewState.Busy);
    questionState = await _api.fetchQuestions(phone);
    setState(ViewState.Idle);
  }

  bool changeActionNextQuestion = false;

  bool isEnablePreviousQuestionButton = false;

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
      isEnablePreviousQuestionButton = true;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_index > 0) {
      _index--;
    } else {
      isEnablePreviousQuestionButton = false;
    }
    notifyListeners();
  }

  void updateOptionState(int id) {
    if (currentQuestion != null) {
      if (currentQuestion.answerModels.isNotEmpty &&
          id < currentQuestion.answerModels.length) {
        if (currentQuestion.answerModels.where((element) {
              return (element.state == OptionState.correct ||
                  element.state == OptionState.wrong);
            }).toList().isEmpty) {
          currentQuestion.answerModels[0].state = OptionState.correct;
          if (id != 0) {
            currentQuestion.answerModels[id].state = OptionState.wrong;
            currentQuestion.optionState=OptionState.wrong;
          }else{
            currentQuestion.optionState=OptionState.correct;
          }
          notifyListeners();
        }
      }
    }
  }

}
