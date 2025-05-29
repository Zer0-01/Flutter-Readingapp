import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:readingapps/configuration/app_logger.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _log = AppLogger.getLogger("RegisterBloc");
  RegisterBloc() : super(const RegisterState()) {
    on<OnTapObscureEvent>(_onTapObscureEvent);
  }

  void _onTapObscureEvent(
      OnTapObscureEvent event, Emitter<RegisterState> emit) {
    _log.debug("BEGIN: _onTapObscureEvent");
    emit(state.copyWith(isObscureText: !state.isObscureText));
  }
}
