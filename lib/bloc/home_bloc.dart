import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_flutter_web_app/bloc/home_event.dart';
import 'package:sample_flutter_web_app/bloc/home_state.dart';
import 'package:sample_flutter_web_app/repository/main_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MainRepository mainRepository;

  HomeBloc({required this.mainRepository}) : super(HomeInit());


  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is FetchStatus){
      yield HomeLoading();
      try {
        final status = await mainRepository.fetchUserStatus(event.phone);
        yield HomeLoaded(status: status);
      } catch (e) {
        yield HomeError(message: e.toString());
      }
    }
  }

}