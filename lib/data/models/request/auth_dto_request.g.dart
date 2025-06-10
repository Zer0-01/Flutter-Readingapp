// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDtoRequest _$AuthDtoRequestFromJson(Map<String, dynamic> json) =>
    AuthDtoRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthDtoRequestToJson(AuthDtoRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
