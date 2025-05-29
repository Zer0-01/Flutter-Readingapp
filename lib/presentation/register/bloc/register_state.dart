part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isObscureText;

  const RegisterState({
    this.isObscureText = false,
  });

  RegisterState copyWith({
    bool? isObscureText,
  }) {
    return RegisterState(
      isObscureText: isObscureText ?? this.isObscureText,
    );
  }

  @override
  List<Object?> get props => [isObscureText];
}
