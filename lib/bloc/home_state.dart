import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeState extends Equatable{

  @override
  List<Object> get props =>const [];

}

class HomeInit extends HomeState{
}

class HomeLoading extends HomeState{
}

class HomeLoaded extends HomeState{
  final String status;
  HomeLoaded({@required this.status});
}

class HomeError extends HomeState{
  final String message;
  HomeError({this.message});
}