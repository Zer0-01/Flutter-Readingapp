import 'package:json_annotation/json_annotation.dart';

part 'auth_dto_request.g.dart';

@JsonSerializable()
class AuthDtoRequest {
  final String email;
  final String password;

  AuthDtoRequest({required this.email, required this.password});

  factory AuthDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDtoRequestToJson(this);
}
