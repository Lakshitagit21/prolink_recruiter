// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobApplicationImpl _$$JobApplicationImplFromJson(Map<String, dynamic> json) =>
    _$JobApplicationImpl(
      applicationId: json['applicationId'] as String,
      jobSeekerId: json['jobSeekerId'] as String,
      jobId: json['jobId'] as String,
      applicationStatus: json['applicationStatus'] as String,
      applicationDate: const TimestampConverter()
          .fromJson(json['applicationDate'] as Timestamp),
      resumeUrl: json['resumeUrl'] as String,
    );

Map<String, dynamic> _$$JobApplicationImplToJson(
        _$JobApplicationImpl instance) =>
    <String, dynamic>{
      'applicationId': instance.applicationId,
      'jobSeekerId': instance.jobSeekerId,
      'jobId': instance.jobId,
      'applicationStatus': instance.applicationStatus,
      'applicationDate':
          const TimestampConverter().toJson(instance.applicationDate),
      'resumeUrl': instance.resumeUrl,
    };
