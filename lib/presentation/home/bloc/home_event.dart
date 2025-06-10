part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class OnInitHomeEvent extends HomeEvent {
  const OnInitHomeEvent();
  @override
  List<Object> get props => [];
}
