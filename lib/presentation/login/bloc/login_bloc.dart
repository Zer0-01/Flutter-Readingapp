import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/configuration/app_logger.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _log = AppLogger.getLogger("LoginBloc");

  LoginBloc() : super(const LoginState()) {
    on<OnPressedEyeIconEvent>(_onPressedEyeIconEvent);
  }

  void _onPressedEyeIconEvent(
      OnPressedEyeIconEvent event, Emitter<LoginState> emit) {
    _log.debug("BEGIN: _onPressedEyeIconEvent");
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
