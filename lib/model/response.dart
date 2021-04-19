import 'package:json_annotation/json_annotation.dart';
import 'package:sample_flutter_web_app/model/question.dart';

part 'response.g.dart';

@JsonSerializable()
class QuestionResponse{

  final int status;

  //@JsonKey(defaultValue:null)
  final List<Question>? questions;

  QuestionResponse({this.questions,required this.status});


  factory QuestionResponse.fromJson(Map<String, dynamic> json) => _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}

@JsonSerializable()
class QuestionResponseData{

  final QuestionResponse? data;

  QuestionResponseData(this.data);

  factory QuestionResponseData.fromJson(Map<String, dynamic> json) => _$QuestionResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseDataToJson(this);

}