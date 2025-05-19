import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model_converters/timestamp_converter.dart';

part 'job_seeker.freezed.dart';
part 'job_seeker.g.dart';

@unfreezed
class JobSeeker with _$JobSeeker {
  @JsonSerializable(explicitToJson: true)
  factory JobSeeker({
    required String uid,
    required String email,
    String? userName,
    String? phone,
    @TimestampConverter() Timestamp? registrationDate,
    String? resumeUrl, // 🔹 NEW FIELD
  }) = _JobSeeker;

  factory JobSeeker.fromJson(Map<String, dynamic> json) =>
      _$JobSeekerFromJson(json);
}