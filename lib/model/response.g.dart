// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) {
  return QuestionResponse(
    questions: (json['questions'] as List)
            ?.map((e) =>
                e == null ? null : Question.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'questions': instance.questions,
    };

QuestionResponseData _$QuestionResponseDataFromJson(Map<String, dynamic> json) {
  return QuestionResponseData(
    json['data'] == null
        ? null
        : QuestionResponse.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuestionResponseDataToJson(
        QuestionResponseData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
