import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{

  @override
  List<Object> get props =>const [];

}

class HomeInit extends HomeState{
}

class HomeLoading extends HomeState{
}

class HomeLoaded extends HomeState{
  final int status;
  HomeLoaded({required this.status});

  @override
  List<Object> get props => [status];
}

class HomeError extends HomeState{
  final String? message;
  HomeError({this.message});
}