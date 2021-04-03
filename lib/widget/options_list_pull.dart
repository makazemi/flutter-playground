import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/viewModel/list_pull_question_viewmodel.dart';
import 'package:sample_flutter_web_app/widget/option_row.dart';
import 'package:provider/provider.dart';

class OptionListPull extends StatelessWidget {
  final String phoneNumber;

  OptionListPull(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return
        Consumer<ListPullQuestionViewModel>(
          builder: (context, model, child){
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var option = model.currentQuestion.answerModels[index];
                return OptionRow(answer: option,onClickOption: (id){
                  model.updateOptionState(phoneNumber,id);
                },);
              },
              itemCount: model.currentQuestion.answerModels.length,
            );
          },
        );
  }
}

