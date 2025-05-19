// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
      jobId: json['jobId'] as String?,
      title: json['title'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      recruiterId: json['recruiterId'] as String,
      jobType: json['jobType'] as String,
      locationType: json['locationType'] as String,
      experienceLevel: json['experienceLevel'] as String,
      salary: json['salary'] as num,
      description: json['description'] as String?,
      location: json['location'] as String?,
      logo: ImageModel.fromJson(json['logo'] as Map<String, dynamic>),
      status: json['status'] as String? ?? 'active',
    );

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
      'jobId': instance.jobId,
      'title': instance.title,
      'company': instance.company.toJson(),
      'recruiterId': instance.recruiterId,
      'jobType': instance.jobType,
      'locationType': instance.locationType,
      'experienceLevel': instance.experienceLevel,
      'salary': instance.salary,
      'description': instance.description,
      'location': instance.location,
      'logo': instance.logo.toJson(),
      'status': instance.status,
    };
