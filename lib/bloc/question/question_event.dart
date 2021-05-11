import 'package:equatable/equatable.dart';
import 'package:sample_flutter_web_app/bloc/question/question_state.dart';

abstract class QuestionEvent extends Equatable {
  @override
  List<Object> get props =>const [];
}

class FetchQuestion extends QuestionEvent{
  final String phone;
  FetchQuestion(this.phone);

  @override
  List<Object> get props => [phone];
}

class NextQuestion extends QuestionEvent{

}

class PreviousQuestion extends QuestionEvent{

}
class AnswerToQuestion extends QuestionState{
  final String answer;

}