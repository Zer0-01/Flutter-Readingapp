part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class OnPressedEyeIconEvent extends LoginEvent {
  const OnPressedEyeIconEvent();
  @override
  List<Object?> get props => [];
}
