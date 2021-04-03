import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  final String label;

  final List<String> answers;

  @JsonKey(defaultValue: "")
  final String answer;

  @JsonKey(defaultValue: 0)
  final int number;

  @JsonKey(ignore: true)
  List<Answer> answerModels=[];

  @JsonKey(ignore: true)
  OptionState optionState=OptionState.none;

  Question({this.label, this.answer, this.answers, this.number});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  String toString() {
    return 'label=$label\n';
  }
}

class Answer{

  OptionState state=OptionState.none;
  final String text;
  final int id;

  Answer(this.id,this.text);

}

class QuestionState{
  final List<Question> data;
  final String error;
  QuestionState({this.data,this.error});
}

class ResponsePostAnswer{
  final String data;
  final String error;
  ResponsePostAnswer({this.data,this.error});
}

class StatusState{
  final int data;
  final String error;
  StatusState({this.data,this.error});
}

enum OptionState{
  none,
  wrong,
  correct
}
