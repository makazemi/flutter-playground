import 'package:bloc/bloc.dart';
import 'package:sample_flutter_web_app/bloc/question/question_event.dart';
import 'package:sample_flutter_web_app/bloc/question/question_state.dart';
import 'package:sample_flutter_web_app/model/question.dart';
import 'package:sample_flutter_web_app/repository/main_repository.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final MainRepository mainRepository;

  QuestionBloc({required this.mainRepository}) : super(QuestionInit());

  Question? currentQuestion;
  List<Question>? questions;
  int currentIndex=0;
  int size=0;

  @override
  Stream<QuestionState> mapEventToState(QuestionEvent event) async* {
    if(event is FetchQuestion){
      yield QuestionLoading();
      try {
        questions = await mainRepository.fetchQuestions(event.phone);
        if(questions!=null){
          if(questions!.isNotEmpty){
            size=questions?.length ?? 0;
            currentQuestion=questions![currentIndex];
          }

        }
        yield ChangeQuestion(currentQuestion);
      } catch (e) {
        yield QuestionError(message: e.toString());
      }
    }
    if(event is NextQuestion){
      if(questions!=null){
        if(currentIndex+1< size){
          currentIndex++;
          currentQuestion=questions![currentIndex];
          yield ChangeQuestion(currentQuestion);
        }
        else{
          yield FinishQuestions();
        }
      }
    }
    if(event is PreviousQuestion){
      if(questions!=null) {
        if(currentIndex-1>=0){
          currentIndex--;
          currentQuestion=questions![currentIndex];
          yield ChangeQuestion(currentQuestion);
        }
      }
    }
  }

}