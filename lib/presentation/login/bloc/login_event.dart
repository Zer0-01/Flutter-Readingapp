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

class OnPressedLoginButtonEvent extends LoginEvent {
  final String email;
  final String password;

  const OnPressedLoginButtonEvent(
      {required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
