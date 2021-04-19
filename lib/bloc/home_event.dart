import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props =>const [];
}

class FetchStatus extends HomeEvent {

  final String phone;

  FetchStatus({required this.phone});

  @override
  List<Object> get props => [phone];
}
