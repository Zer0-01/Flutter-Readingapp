import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/data/models/request/auth_dto_request.dart';
import 'package:readingapps/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _log = AppLogger.getLogger("LoginBloc");
  late final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState()) {
    on<OnPressedEyeIconEvent>(_onPressedEyeIconEvent);
    on<OnPressedLoginButtonEvent>(_onPressedLoginButtonEvent);
  }

  void _onPressedEyeIconEvent(
      OnPressedEyeIconEvent event, Emitter<LoginState> emit) {
    _log.debug("BEGIN: _onPressedEyeIconEvent");
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onPressedLoginButtonEvent(
      OnPressedLoginButtonEvent event, Emitter<LoginState> emit) async {
    _log.debug("BEGIN: _onPressedLoginButtonEvent");

    emit(state.copyWith(loginStatus: LoginStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    final authDtoRequest =
        AuthDtoRequest(email: event.email, password: event.password);
    await _authRepository.postAuth(authDtoRequest);

    emit(state.copyWith(loginStatus: LoginStatus.success));
  }
}
