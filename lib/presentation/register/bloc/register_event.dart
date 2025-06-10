part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class OnTapObscureEvent extends RegisterEvent {
  const OnTapObscureEvent();
  @override
  List<Object?> get props => [];
}

class OnPressedRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  const OnPressedRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [name, email, password];
}
