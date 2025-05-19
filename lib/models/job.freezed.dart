// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  String? get jobId => throw _privateConstructorUsedError;
  set jobId(String? value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  Company get company => throw _privateConstructorUsedError;
  set company(Company value) => throw _privateConstructorUsedError;
  String get recruiterId => throw _privateConstructorUsedError;
  set recruiterId(String value) => throw _privateConstructorUsedError;
  String get jobType => throw _privateConstructorUsedError;
  set jobType(String value) =>
      throw _privateConstructorUsedError; // e.g., Full-Time, Part-Time
  String get locationType =>
      throw _privateConstructorUsedError; // e.g., Full-Time, Part-Time
  set locationType(String value) => throw _privateConstructorUsedError;
  String get experienceLevel => throw _privateConstructorUsedError;
  set experienceLevel(String value) => throw _privateConstructorUsedError;
  num get salary => throw _privateConstructorUsedError;
  set salary(num value) => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  set description(String? value) => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  set location(String? value) => throw _privateConstructorUsedError;
  ImageModel get logo => throw _privateConstructorUsedError;
  set logo(ImageModel value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call(
      {String? jobId,
      String title,
      Company company,
      String recruiterId,
      String jobType,
      String locationType,
      String experienceLevel,
      num salary,
      String? description,
      String? location,
      ImageModel logo,
      String status});

  $CompanyCopyWith<$Res> get company;
  $ImageModelCopyWith<$Res> get logo;
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = freezed,
    Object? title = null,
    Object? company = null,
    Object? recruiterId = null,
    Object? jobType = null,
    Object? locationType = null,
    Object? experienceLevel = null,
    Object? salary = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? logo = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      jobId: freezed == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      experienceLevel: null == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as num,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res> get company {
    return $CompanyCopyWith<$Res>(_value.company, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImageModelCopyWith<$Res> get logo {
    return $ImageModelCopyWith<$Res>(_value.logo, (value) {
      return _then(_value.copyWith(logo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? jobId,
      String title,
      Company company,
      String recruiterId,
      String jobType,
      String locationType,
      String experienceLevel,
      num salary,
      String? description,
      String? location,
      ImageModel logo,
      String status});

  @override
  $CompanyCopyWith<$Res> get company;
  @override
  $ImageModelCopyWith<$Res> get logo;
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
      : super(_value, _then);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobId = freezed,
    Object? title = null,
    Object? company = null,
    Object? recruiterId = null,
    Object? jobType = null,
    Object? locationType = null,
    Object? experienceLevel = null,
    Object? salary = null,
    Object? description = freezed,
    Object? location = freezed,
    Object? logo = null,
    Object? status = null,
  }) {
    return _then(_$JobImpl(
      jobId: freezed == jobId
          ? _value.jobId
          : jobId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as String,
      jobType: null == jobType
          ? _value.jobType
          : jobType // ignore: cast_nullable_to_non_nullable
              as String,
      locationType: null == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String,
      experienceLevel: null == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as num,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as ImageModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JobImpl implements _Job {
  _$JobImpl(
      {this.jobId,
      required this.title,
      required this.company,
      required this.recruiterId,
      required this.jobType,
      required this.locationType,
      required this.experienceLevel,
      required this.salary,
      this.description,
      this.location,
      required this.logo,
      this.status = 'active'});

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  String? jobId;
  @override
  String title;
  @override
  Company company;
  @override
  String recruiterId;
  @override
  String jobType;
// e.g., Full-Time, Part-Time
  @override
  String locationType;
  @override
  String experienceLevel;
  @override
  num salary;
  @override
  String? description;
  @override
  String? location;
  @override
  ImageModel logo;
  @override
  @JsonKey()
  String status;

  @override
  String toString() {
    return 'Job(jobId: $jobId, title: $title, company: $company, recruiterId: $recruiterId, jobType: $jobType, locationType: $locationType, experienceLevel: $experienceLevel, salary: $salary, description: $description, location: $location, logo: $logo, status: $status)';
  }

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(
      this,
    );
  }
}

abstract class _Job implements Job {
  factory _Job(
      {String? jobId,
      required String title,
      required Company company,
      required String recruiterId,
      required String jobType,
      required String locationType,
      required String experienceLevel,
      required num salary,
      String? description,
      String? location,
      required ImageModel logo,
      String status}) = _$JobImpl;

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  String? get jobId;
  set jobId(String? value);
  @override
  String get title;
  set title(String value);
  @override
  Company get company;
  set company(Company value);
  @override
  String get recruiterId;
  set recruiterId(String value);
  @override
  String get jobType;
  set jobType(String value); // e.g., Full-Time, Part-Time
  @override
  String get locationType; // e.g., Full-Time, Part-Time
  set locationType(String value);
  @override
  String get experienceLevel;
  set experienceLevel(String value);
  @override
  num get salary;
  set salary(num value);
  @override
  String? get description;
  set description(String? value);
  @override
  String? get location;
  set location(String? value);
  @override
  ImageModel get logo;
  set logo(ImageModel value);
  @override
  String get status;
  set status(String value);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
