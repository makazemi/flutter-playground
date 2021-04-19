import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/widget/option_row.dart';

class OptionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // var option = model.currentQuestion.answerModels[index];
        return OptionRow(answer: Answer(2, 'text'),onClickOption: (id){
          // model.updateOptionState(phoneNumber,id);
        },);
      },
      itemCount:1,
    );
  }
}

