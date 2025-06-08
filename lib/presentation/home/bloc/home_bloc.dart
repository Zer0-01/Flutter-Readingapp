import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/data/models/response/profile_dto_response.dart';
import 'package:readingapps/data/repository/auth_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _log = AppLogger.getLogger("HomeBloc");
  final AuthRepository _authRepository;
  HomeBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const HomeState()) {
    on<OnInitHomeEvent>(_onInitHomeEvent);
  }

  Future<void> _onInitHomeEvent(
      OnInitHomeEvent event, Emitter<HomeState> emit) async {
    _log.debug("BEGIN: _onInitHomeEvent");
    final ProfileDtoResponse profileDtoResponse =
        await _authRepository.getProfile();

    _log.debug("profileDtoResponse: ${profileDtoResponse.name}");
  }
}
