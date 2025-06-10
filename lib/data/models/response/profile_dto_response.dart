import 'package:json_annotation/json_annotation.dart';

part 'profile_dto_response.g.dart';

@JsonSerializable()
class ProfileDtoResponse {
  final String name;
  final String email;

  ProfileDtoResponse({required this.name, required this.email});

  factory ProfileDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileDtoResponseToJson(this);
}
