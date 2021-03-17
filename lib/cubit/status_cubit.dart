import 'package:bloc/bloc.dart';
import 'package:sample_flutter_web_app/cubit/status_state.dart';
import 'package:sample_flutter_web_app/data/repository.dart';

import  'status_state.dart';

class StatusCubit extends Cubit<StatusState> {
  final QuestionRepository _repository;

  StatusCubit(this._repository) : super(StatusInitial());

  Future<void> getStatus(String phone) async {
    try {
      emit(StatusLoading());
      final status = await _repository.fetchStatus(phone);
      emit(StatusLoaded(status));
    } on NetworkException {
      emit(StatusError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
