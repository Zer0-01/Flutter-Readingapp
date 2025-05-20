part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final bool isPasswordVisible;
  final LoginStatus loginStatus;

  const LoginState(
      {this.isPasswordVisible = false, this.loginStatus = LoginStatus.initial});

  LoginState copyWith({bool? isPasswordVisible, LoginStatus? loginStatus}) {
    return LoginState(
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [isPasswordVisible, loginStatus];
}
