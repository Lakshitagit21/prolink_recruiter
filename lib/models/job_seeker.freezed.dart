// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_seeker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JobSeeker _$JobSeekerFromJson(Map<String, dynamic> json) {
  return _JobSeeker.fromJson(json);
}

/// @nodoc
mixin _$JobSeeker {
  String get uid => throw _privateConstructorUsedError;
  set uid(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  set phone(String? value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get registrationDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  set registrationDate(Timestamp? value) => throw _privateConstructorUsedError;
  String? get resumeUrl => throw _privateConstructorUsedError;
  set resumeUrl(String? value) => throw _privateConstructorUsedError;

  /// Serializes this JobSeeker to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JobSeeker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobSeekerCopyWith<JobSeeker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobSeekerCopyWith<$Res> {
  factory $JobSeekerCopyWith(JobSeeker value, $Res Function(JobSeeker) then) =
      _$JobSeekerCopyWithImpl<$Res, JobSeeker>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? registrationDate,
      String? resumeUrl});
}

/// @nodoc
class _$JobSeekerCopyWithImpl<$Res, $Val extends JobSeeker>
    implements $JobSeekerCopyWith<$Res> {
  _$JobSeekerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JobSeeker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? registrationDate = freezed,
    Object? resumeUrl = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: freezed == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      resumeUrl: freezed == resumeUrl
          ? _value.resumeUrl
          : resumeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobSeekerImplCopyWith<$Res>
    implements $JobSeekerCopyWith<$Res> {
  factory _$$JobSeekerImplCopyWith(
          _$JobSeekerImpl value, $Res Function(_$JobSeekerImpl) then) =
      __$$JobSeekerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? registrationDate,
      String? resumeUrl});
}

/// @nodoc
class __$$JobSeekerImplCopyWithImpl<$Res>
    extends _$JobSeekerCopyWithImpl<$Res, _$JobSeekerImpl>
    implements _$$JobSeekerImplCopyWith<$Res> {
  __$$JobSeekerImplCopyWithImpl(
      _$JobSeekerImpl _value, $Res Function(_$JobSeekerImpl) _then)
      : super(_value, _then);

  /// Create a copy of JobSeeker
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? userName = freezed,
    Object? phone = freezed,
    Object? registrationDate = freezed,
    Object? resumeUrl = freezed,
  }) {
    return _then(_$JobSeekerImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: freezed == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      resumeUrl: freezed == resumeUrl
          ? _value.resumeUrl
          : resumeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JobSeekerImpl implements _JobSeeker {
  _$JobSeekerImpl(
      {required this.uid,
      required this.email,
      this.userName,
      this.phone,
      @TimestampConverter() this.registrationDate,
      this.resumeUrl});

  factory _$JobSeekerImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobSeekerImplFromJson(json);

  @override
  String uid;
  @override
  String email;
  @override
  String? userName;
  @override
  String? phone;
  @override
  @TimestampConverter()
  Timestamp? registrationDate;
  @override
  String? resumeUrl;

  @override
  String toString() {
    return 'JobSeeker(uid: $uid, email: $email, userName: $userName, phone: $phone, registrationDate: $registrationDate, resumeUrl: $resumeUrl)';
  }

  /// Create a copy of JobSeeker
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobSeekerImplCopyWith<_$JobSeekerImpl> get copyWith =>
      __$$JobSeekerImplCopyWithImpl<_$JobSeekerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobSeekerImplToJson(
      this,
    );
  }
}

abstract class _JobSeeker implements JobSeeker {
  factory _JobSeeker(
      {required String uid,
      required String email,
      String? userName,
      String? phone,
      @TimestampConverter() Timestamp? registrationDate,
      String? resumeUrl}) = _$JobSeekerImpl;

  factory _JobSeeker.fromJson(Map<String, dynamic> json) =
      _$JobSeekerImpl.fromJson;

  @override
  String get uid;
  set uid(String value);
  @override
  String get email;
  set email(String value);
  @override
  String? get userName;
  set userName(String? value);
  @override
  String? get phone;
  set phone(String? value);
  @override
  @TimestampConverter()
  Timestamp? get registrationDate;
  @TimestampConverter()
  set registrationDate(Timestamp? value);
  @override
  String? get resumeUrl;
  set resumeUrl(String? value);

  /// Create a copy of JobSeeker
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobSeekerImplCopyWith<_$JobSeekerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
