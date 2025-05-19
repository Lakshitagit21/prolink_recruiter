// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobApplication _$JobApplicationFromJson(Map<String, dynamic> json) {
  return _JobApplication.fromJson(json);
}

/// @nodoc
mixin _$JobApplication {
  String get applicationId => throw _privateConstructorUsedError;
  set applicationId(String value) => throw _privateConstructorUsedError;
  String get jobSeekerId => throw _privateConstructorUsedError;
  set jobSeekerId(String value) => throw _privateConstructorUsedError;
  String get jobId => throw _privateConstructorUsedError;
  set jobId(String value) => throw _privateConstructorUsedError;
  String get applicationStatus => throw _privateConstructorUsedError;
  set applicationStatus(String value) =>
      throw _privateConstructorUsedError; // Pending, Accepted, Rejected
  @TimestampConverter()
  Timestamp get applicationDate =>
      throw _privateConstructorUsedError; // Pending, Accepted, Rejected
  @TimestampConverter()
  set applicationDate(Timestamp value) => throw _privateConstructorUsedError;
  String get resumeUrl => throw _privateConstructorUsedError;
  set resumeUrl(String value) => throw _privateConstructorUsedError;

  /// Serializes this JobApplication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobApplicationCopyWith<JobApplication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobApplicationCopyWith<$Res> {
  factory $JobApplicationCopyWith(
          JobApplication value, $Res Function(JobApplication) then) =
      _$JobApplicationCopyWithImpl<$Res, JobApplication>;
  @useResult
  $Res call(
      {String applicationId,
      String jobSeekerId,
      String jobId,
      String applicationStatus,
      @TimestampConverter() Timestamp applicationDate,
      String resumeUrl});
}

/// @nodoc
class _$JobApplicationCopyWithImpl<$Res, $Val extends JobApplication>
    implements $JobApplicationCopyWith<$Res> {
  _$JobApplicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? jobSeekerId = null,
    Object? jobId = null,
    Object? applicationStatus = null,
    Object? applicationDate = null,
    Object? resumeUrl = null,
  }) {
    return _then(_value.copyWith(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      jobSeekerId: null == jobSeekerId
          ? _value.jobSeekerId
          : jobSeekerId // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      applicationStatus: null == applicationStatus
          ? _value.applicationStatus
          : applicationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      applicationDate: null == applicationDate
          ? _value.applicationDate
          : applicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      resumeUrl: null == resumeUrl
          ? _value.resumeUrl
          : resumeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobApplicationImplCopyWith<$Res>
    implements $JobApplicationCopyWith<$Res> {
  factory _$$JobApplicationImplCopyWith(_$JobApplicationImpl value,
          $Res Function(_$JobApplicationImpl) then) =
      __$$JobApplicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String applicationId,
      String jobSeekerId,
      String jobId,
      String applicationStatus,
      @TimestampConverter() Timestamp applicationDate,
      String resumeUrl});
}

/// @nodoc
class __$$JobApplicationImplCopyWithImpl<$Res>
    extends _$JobApplicationCopyWithImpl<$Res, _$JobApplicationImpl>
    implements _$$JobApplicationImplCopyWith<$Res> {
  __$$JobApplicationImplCopyWithImpl(
      _$JobApplicationImpl _value, $Res Function(_$JobApplicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobApplication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applicationId = null,
    Object? jobSeekerId = null,
    Object? jobId = null,
    Object? applicationStatus = null,
    Object? applicationDate = null,
    Object? resumeUrl = null,
  }) {
    return _then(_$JobApplicationImpl(
      applicationId: null == applicationId
          ? _value.applicationId
          : applicationId // ignore: cast_nullable_to_non_nullable
              as String,
      jobSeekerId: null == jobSeekerId
          ? _value.jobSeekerId
          : jobSeekerId // ignore: cast_nullable_to_non_nullable
              as String,
      jobId: null == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String,
      applicationStatus: null == applicationStatus
          ? _value.applicationStatus
          : applicationStatus // ignore: cast_nullable_to_non_nullable
              as String,
      applicationDate: null == applicationDate
          ? _value.applicationDate
          : applicationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      resumeUrl: null == resumeUrl
          ? _value.resumeUrl
          : resumeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JobApplicationImpl implements _JobApplication {
  _$JobApplicationImpl(
      {required this.applicationId,
      required this.jobSeekerId,
      required this.jobId,
      required this.applicationStatus,
      @TimestampConverter() required this.applicationDate,
      required this.resumeUrl});

  factory _$JobApplicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobApplicationImplFromJson(json);

  @override
  String applicationId;
  @override
  String jobSeekerId;
  @override
  String jobId;
  @override
  String applicationStatus;
// Pending, Accepted, Rejected
  @override
  @TimestampConverter()
  Timestamp applicationDate;
  @override
  String resumeUrl;

  @override
  String toString() {
    return 'JobApplication(applicationId: $applicationId, jobSeekerId: $jobSeekerId, jobId: $jobId, applicationStatus: $applicationStatus, applicationDate: $applicationDate, resumeUrl: $resumeUrl)';
  }

  /// Create a copy of JobApplication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobApplicationImplCopyWith<_$JobApplicationImpl> get copyWith =>
      __$$JobApplicationImplCopyWithImpl<_$JobApplicationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobApplicationImplToJson(
      this,
    );
  }
}

abstract class _JobApplication implements JobApplication {
  factory _JobApplication(
      {required String applicationId,
      required String jobSeekerId,
      required String jobId,
      required String applicationStatus,
      @TimestampConverter() required Timestamp applicationDate,
      required String resumeUrl}) = _$JobApplicationImpl;

  factory _JobApplication.fromJson(Map<String, dynamic> json) =
      _$JobApplicationImpl.fromJson;

  @override
  String get applicationId;
  set applicationId(String value);
  @override
  String get jobSeekerId;
  set jobSeekerId(String value);
  @override
  String get jobId;
  set jobId(String value);
  @override
  String get applicationStatus;
  set applicationStatus(String value); // Pending, Accepted, Rejected
  @override
  @TimestampConverter()
  Timestamp get applicationDate; // Pending, Accepted, Rejected
  @TimestampConverter()
  set applicationDate(Timestamp value);
  @override
  String get resumeUrl;
  set resumeUrl(String value);

  /// Create a copy of JobApplication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobApplicationImplCopyWith<_$JobApplicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
