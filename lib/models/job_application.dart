import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model_converters/timestamp_converter.dart';

part 'job_application.freezed.dart';
part 'job_application.g.dart';

@unfreezed
class JobApplication with _$JobApplication {
  @JsonSerializable(explicitToJson: true)
  factory JobApplication({
    required String applicationId,
    required String jobSeekerId,
    required String jobId,
    required String applicationStatus, // Pending, Accepted, Rejected
    @TimestampConverter() required Timestamp applicationDate,
    required String resumeUrl,
  }) = _JobApplication;

  factory JobApplication.fromJson(Map<String, dynamic> json) =>
      _$JobApplicationFromJson(json);
}