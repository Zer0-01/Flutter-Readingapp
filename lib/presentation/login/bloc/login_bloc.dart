import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/configuration/app_local_storage.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/data/models/request/login_dto_request.dart';
import 'package:readingapps/data/models/response/login_dto_response.dart';
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
    try {
      final LoginDtoRequest authDtoRequest =
          LoginDtoRequest(email: event.email, password: event.password);

      final LoginDtoResponse loginDtoResponse =
          await _authRepository.postLogin(authDtoRequest);

      _log.debug("loginDtoResponse: ${loginDtoResponse.accessToken}");

      await AppLocalStorage()
          .save(StorageKeys.jwtToken.name, loginDtoResponse.accessToken);

      emit(state.copyWith(loginStatus: LoginStatus.success));
    } on DioException catch (e) {
      _log.error(e.message);
      emit(state.copyWith(loginStatus: LoginStatus.error));
    } catch (e) {
      _log.error(e.toString());
      emit(state.copyWith(loginStatus: LoginStatus.error));
    }
  }
}
