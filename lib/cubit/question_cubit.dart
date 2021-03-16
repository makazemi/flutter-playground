import 'package:bloc/bloc.dart';
import 'package:sample_flutter_web_app/data/repository.dart';

import  'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionRepository _repository;

  QuestionCubit(this._repository) : super(QuestionInitial());

  Future<void> getQuestions(String phone) async {
    try {
      emit(QuestionLoading());
      final questions = await _repository.fetchQuestions(phone);
      emit(QuestionLoaded(questions));
    } on NetworkException {
      emit(QuestionError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
