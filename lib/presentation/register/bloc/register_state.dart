part of 'register_bloc.dart';

enum RegisterStatus {
  initial,
  loading,
  success,
  failure,
}

class RegisterState extends Equatable {
  final RegisterStatus registerStatus;
  final bool isObscureText;

  const RegisterState({
    this.registerStatus = RegisterStatus.initial,
    this.isObscureText = false,
  });

  RegisterState copyWith({
    RegisterStatus? registerStatus,
    bool? isObscureText,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
      isObscureText: isObscureText ?? this.isObscureText,
    );
  }

  @override
  List<Object?> get props => [registerStatus, isObscureText];
}
