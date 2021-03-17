import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/viewModel/list_question_viewmodel.dart';
import 'package:sample_flutter_web_app/widget/option_row.dart';
import 'package:provider/provider.dart';

class OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        Consumer<ListQuestionViewModel>(
          builder: (context, model, child){
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var option = model.currentQuestion.answerModels[index];
                return OptionRow(answer: option,onClickOption: (id){
                  model.updateOptionState(id);
                },);
              },
              itemCount: model.currentQuestion.answerModels.length,
            );
          },
        );
  }
}

