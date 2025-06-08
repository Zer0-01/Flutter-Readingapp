import 'package:json_annotation/json_annotation.dart';

part 'login_dto_response.g.dart';

@JsonSerializable()
class LoginDtoResponse {
  final String accessToken;

  LoginDtoResponse({
    required this.accessToken,
  });

  factory LoginDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoResponseToJson(this);
}
