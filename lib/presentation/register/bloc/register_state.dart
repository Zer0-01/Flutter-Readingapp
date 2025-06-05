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
  final DioExceptionType dioExceptionType;
  final int dioBadResponseCode;

  const RegisterState({
    this.registerStatus = RegisterStatus.initial,
    this.isObscureText = true,
    this.dioExceptionType = DioExceptionType.unknown,
    this.dioBadResponseCode = 0,
  });

  RegisterState copyWith({
    RegisterStatus? registerStatus,
    bool? isObscureText,
    DioExceptionType? dioExceptionType,
    int? dioBadResponseCode,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
      isObscureText: isObscureText ?? this.isObscureText,
      dioExceptionType: dioExceptionType ?? this.dioExceptionType,
      dioBadResponseCode: dioBadResponseCode ?? this.dioBadResponseCode,
    );
  }

  @override
  List<Object?> get props =>
      [registerStatus, isObscureText, dioExceptionType, dioBadResponseCode];
}
