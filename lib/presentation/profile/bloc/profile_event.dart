part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class OnInitProfileEvent extends ProfileEvent {
  const OnInitProfileEvent();
  @override
  List<Object> get props => [];
}
