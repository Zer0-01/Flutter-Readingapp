part of 'profile_bloc.dart';

enum FetchProfileStatus {
  initial,
  loading,
  success,
  error,
}

class ProfileState extends Equatable {
  final FetchProfileStatus fetchProfileStatus;
  final String name;
  final String email;
  final DioExceptionType dioExceptionTypeFetchProfile;
  final String dioBadResponseCodeFetchProfile;

  const ProfileState({
    this.fetchProfileStatus = FetchProfileStatus.initial,
    this.name = "",
    this.email = "",
    this.dioExceptionTypeFetchProfile = DioExceptionType.unknown,
    this.dioBadResponseCodeFetchProfile = "",
  });

  ProfileState copyWith({
    FetchProfileStatus? fetchProfileStatus,
    String? name,
    String? email,
    DioExceptionType? dioExceptionTypeFetchProfile,
    String? dioBadResponseCodeFetchProfile,
  }) {
    return ProfileState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      name: name ?? this.name,
      email: email ?? this.email,
      dioExceptionTypeFetchProfile:
          dioExceptionTypeFetchProfile ?? this.dioExceptionTypeFetchProfile,
    );
  }

  @override
  List<Object> get props => [
        fetchProfileStatus,
        name,
        email,
        dioExceptionTypeFetchProfile,
        dioBadResponseCodeFetchProfile,
      ];
}
