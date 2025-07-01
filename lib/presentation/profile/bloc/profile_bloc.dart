import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readingapps/configuration/app_logger.dart';
import 'package:readingapps/data/models/response/profile_dto_response.dart';
import 'package:readingapps/data/repository/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _logger = AppLogger.getLogger("ProfileBloc");
  late final AuthRepository _authRepository;

  ProfileBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const ProfileState()) {
    on<OnInitProfileEvent>(_onInitProfile);
  }

  Future<void> _onInitProfile(
      OnInitProfileEvent event, Emitter<ProfileState> emit) async {
    _logger.debug("onInitProfile");

    try {
      emit(state.copyWith(fetchProfileStatus: FetchProfileStatus.loading));

      await Future.delayed(const Duration(seconds: 2));
      final ProfileDtoResponse profileDtoResponse =
          await _authRepository.getProfile();

      final String name = profileDtoResponse.name;
      final String email = profileDtoResponse.email;

      emit(state.copyWith(
          fetchProfileStatus: FetchProfileStatus.success,
          name: name,
          email: email));
    } on DioException catch (e) {
      _logger.error("onInitProfile ${e.toString()}");
      emit(state.copyWith(
          fetchProfileStatus: FetchProfileStatus.error,
          dioExceptionTypeFetchProfile: e.type,
          dioBadResponseCodeFetchProfile:
              e.response?.statusCode.toString() ?? ""));
    } catch (e) {
      _logger.error("onInitProfile ${e.toString()}");
      emit(state.copyWith(
          fetchProfileStatus: FetchProfileStatus.error,
          dioExceptionTypeFetchProfile: DioExceptionType.unknown,
          dioBadResponseCodeFetchProfile: ""));
    }
  }
}
