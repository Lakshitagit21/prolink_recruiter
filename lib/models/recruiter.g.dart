// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecruiterImpl _$$RecruiterImplFromJson(Map<String, dynamic> json) =>
    _$RecruiterImpl(
      recruiterId: json['recruiterId'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String?,
      companyName: json['companyName'] as String?,
      contactNumber: json['contactNumber'] as String?,
      registrationDate: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['registrationDate'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$RecruiterImplToJson(_$RecruiterImpl instance) =>
    <String, dynamic>{
      'recruiterId': instance.recruiterId,
      'email': instance.email,
      'userName': instance.userName,
      'companyName': instance.companyName,
      'contactNumber': instance.contactNumber,
      'registrationDate': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.registrationDate, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
