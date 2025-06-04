import 'package:json_annotation/json_annotation.dart';

part 'login_dto_request.g.dart';

@JsonSerializable()
class LoginDtoRequest {
  final String email;
  final String password;

  LoginDtoRequest({required this.email, required this.password});

  factory LoginDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoRequestToJson(this);
}
