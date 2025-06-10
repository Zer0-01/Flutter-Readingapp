// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDtoRequest _$LoginDtoRequestFromJson(Map<String, dynamic> json) =>
    LoginDtoRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginDtoRequestToJson(LoginDtoRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
