// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TCISignupRequest _$TCISignupRequestFromJson(Map<String, dynamic> json) {
  return TCISignupRequest(
    name: json['name'] as String,
    email: json['email'] as String,
    documentNumber: json['documentNumber'] as String,
  );
}

Map<String, dynamic> _$TCISignupRequestToJson(TCISignupRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'documentNumber': instance.documentNumber,
    };
