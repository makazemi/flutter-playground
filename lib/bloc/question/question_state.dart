import 'package:equatable/equatable.dart';
import 'package:sample_flutter_web_app/model/question.dart';

abstract class QuestionState extends Equatable{

  @override
  List<Object> get props =>const [];

}

class QuestionInit extends QuestionState{
}

class QuestionLoading extends QuestionState{
}

class QuestionLoaded extends QuestionState{
  final int status;
  QuestionLoaded({required this.status});

  @override
  List<Object> get props => [status];
}

class QuestionError extends QuestionState{
  final String? message;
  QuestionError({this.message});
}

class CorrectAnswer extends QuestionState{
  final String answer;
  CorrectAnswer(this.answer);

}
class WrongAnswer extends QuestionState{
  final String answer;
  WrongAnswer(this.answer);
}
class ChangeQuestion extends QuestionState{
  final Question? currentQuestion;
  ChangeQuestion(this.currentQuestion);
}
class FinishQuestions extends QuestionState{

}