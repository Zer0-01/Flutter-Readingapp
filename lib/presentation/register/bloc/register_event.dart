part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class OnTapObscureEvent extends RegisterEvent {
  const OnTapObscureEvent();
  @override
  List<Object?> get props => [];
}
