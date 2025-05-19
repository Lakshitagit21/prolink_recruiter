// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_seeker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobSeekerImpl _$$JobSeekerImplFromJson(Map<String, dynamic> json) =>
    _$JobSeekerImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String?,
      phone: json['phone'] as String?,
      registrationDate: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['registrationDate'], const TimestampConverter().fromJson),
      resumeUrl: json['resumeUrl'] as String?,
    );

Map<String, dynamic> _$$JobSeekerImplToJson(_$JobSeekerImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'userName': instance.userName,
      'phone': instance.phone,
      'registrationDate': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.registrationDate, const TimestampConverter().toJson),
      'resumeUrl': instance.resumeUrl,
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
