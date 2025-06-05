import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/data/models/request/register_dto_request.dart';
import 'package:readingapps/data/repository/auth_repository.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _log = AppLogger.getLogger("RegisterBloc");
  final AuthRepository _authRepository;
  RegisterBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegisterState()) {
    on<OnTapObscureEvent>(_onTapObscureEvent);
    on<OnPressedRegisterEvent>(_onPressedRegisterEvent);
  }

  void _onTapObscureEvent(
      OnTapObscureEvent event, Emitter<RegisterState> emit) {
    _log.debug("BEGIN: _onTapObscureEvent");
    emit(state.copyWith(isObscureText: !state.isObscureText));
  }

  Future<void> _onPressedRegisterEvent(
      OnPressedRegisterEvent event, Emitter<RegisterState> emit) async {
    _log.debug("BEGIN: _onPressedRegisterEvent");

    emit(state.copyWith(registerStatus: RegisterStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    try {
      final RegisterDtoRequest registerDtoRequest = RegisterDtoRequest(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      await _authRepository.postRegister(registerDtoRequest);
      emit(state.copyWith(registerStatus: RegisterStatus.success));
    } on DioException catch (e) {
      _log.error("Error: $e");
      emit(state.copyWith(
          registerStatus: RegisterStatus.failure,
          dioExceptionType: e.type,
          dioBadResponseCode: e.response?.statusCode));
    } catch (e) {
      emit(state.copyWith(
          registerStatus: RegisterStatus.failure,
          dioExceptionType: DioExceptionType.unknown,
          dioBadResponseCode: 0));
    }
  }
}
