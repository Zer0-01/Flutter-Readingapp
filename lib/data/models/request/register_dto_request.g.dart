// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDtoRequest _$RegisterDtoRequestFromJson(Map<String, dynamic> json) =>
    RegisterDtoRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterDtoRequestToJson(RegisterDtoRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
