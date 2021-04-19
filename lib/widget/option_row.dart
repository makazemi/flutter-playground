import 'package:flutter/material.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/util/constants.dart';

class OptionRow extends StatelessWidget {
  final Answer answer;

  final Function onClickOption;

  OptionRow({required this.answer,required this.onClickOption});

  Color setBackgroundColorOption() {
    switch (answer.state) {
      case OptionState.none:
        {
          return Colors.white;
        }
        break;
      case OptionState.wrong:
        {
          return grey2;
        }
      case OptionState.correct:
        {
          return green;
        }
      default:
        {
          return Colors.white;
        }
        break;
    }
  }

  Color setTextColorOption() {
    switch (answer.state) {
      case OptionState.none:
        {
          return Colors.grey.shade800;
        }
        break;
      case OptionState.wrong:
        {
          return Colors.white;
        }
      case OptionState.correct:
        {
          return Colors.white;
        }
      default:
        {
          return Colors.grey.shade800;
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
         onClickOption(answer.id);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: setBackgroundColorOption(),
        ),
        child: Center(
          child: Text(
            answer.text,
            style: TextStyle(color: setTextColorOption()),
          ),
        ),
      ),
    );
  }
}
