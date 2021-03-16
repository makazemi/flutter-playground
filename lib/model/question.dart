import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  final String label;

  final List<String> answers;

  @JsonKey(defaultValue: "")
  final String answer;

  @JsonKey(defaultValue: "")
  final String number;

  Question({this.label, this.answer, this.answers, this.number});

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
