import 'package:json_annotation/json_annotation.dart';

part 'register_dto_request.g.dart';

@JsonSerializable()
class RegisterDtoRequest {
  final String name;
  final String email;
  final String password;

  RegisterDtoRequest(
      {required this.name, required this.email, required this.password});

  factory RegisterDtoRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoRequestToJson(this);
}
