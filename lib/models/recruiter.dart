import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model_converters/timestamp_converter.dart';

part 'recruiter.freezed.dart';
part 'recruiter.g.dart';

@unfreezed
class Recruiter with _$Recruiter {
  @JsonSerializable(explicitToJson: true)
  factory Recruiter({
    required String recruiterId,
    required String email,
    String? userName,
    String? companyName,
    String? contactNumber,
    @TimestampConverter() Timestamp? registrationDate,
  }) = _Recruiter;

  factory Recruiter.fromJson(Map<String, dynamic> json) =>
      _$RecruiterFromJson(json);
}
