import 'package:freezed_annotation/freezed_annotation.dart';

import 'company.dart';
import 'image_model.dart';

part 'job.freezed.dart';
part 'job.g.dart';


@unfreezed
class Job with _$Job {
  @JsonSerializable(explicitToJson: true)
  factory Job({
    String? jobId,
    required String title,
    required Company company,
    required String recruiterId,
    required String jobType, // e.g., Full-Time, Part-Time
    required String locationType,
    required String experienceLevel,
    required num salary,
    String? description,
    String? location,
    required ImageModel logo,
    @Default('active') String status,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) =>
      _$JobFromJson(json);
}