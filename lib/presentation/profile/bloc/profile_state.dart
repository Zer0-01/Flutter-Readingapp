part of 'profile_bloc.dart';

enum FetchProfileStatus {
  initial,
  loading,
  success,
  error,
}

class ProfileState extends Equatable {
  final FetchProfileStatus fetchProfileStatus;

  const ProfileState({
    this.fetchProfileStatus = FetchProfileStatus.initial,
  });

  ProfileState copyWith({
    FetchProfileStatus? fetchProfileStatus,
  }) {
    return ProfileState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
    );
  }

  @override
  List<Object> get props => [
        fetchProfileStatus,
      ];
}
