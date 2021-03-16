import 'package:sample_flutter_web_app/model/question.dart';
import 'package:meta/meta.dart';


@immutable
abstract class QuestionState {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionLoading extends QuestionState {
  const QuestionLoading();
}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;
  const QuestionLoaded(this.questions);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionLoaded && o.questions == questions;
  }

  @override
  int get hashCode => questions.hashCode;
}

class QuestionError extends QuestionState {
  final String message;
  const QuestionError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}