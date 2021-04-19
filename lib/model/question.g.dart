// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    label: json['label'] as String,
    answer: json['answer'] as String? ?? '',
    answers:
        (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    number: json['number'] as int? ?? 0,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'label': instance.label,
      'answers': instance.answers,
      'answer': instance.answer,
      'number': instance.number,
    };
