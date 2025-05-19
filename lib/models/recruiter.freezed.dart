// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recruiter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recruiter _$RecruiterFromJson(Map<String, dynamic> json) {
  return _Recruiter.fromJson(json);
}

/// @nodoc
mixin _$Recruiter {
  String get recruiterId => throw _privateConstructorUsedError;
  set recruiterId(String value) => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  set email(String value) => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  set userName(String? value) => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  set companyName(String? value) => throw _privateConstructorUsedError;
  String? get contactNumber => throw _privateConstructorUsedError;
  set contactNumber(String? value) => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get registrationDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  set registrationDate(Timestamp? value) => throw _privateConstructorUsedError;

  /// Serializes this Recruiter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recruiter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecruiterCopyWith<Recruiter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecruiterCopyWith<$Res> {
  factory $RecruiterCopyWith(Recruiter value, $Res Function(Recruiter) then) =
      _$RecruiterCopyWithImpl<$Res, Recruiter>;
  @useResult
  $Res call(
      {String recruiterId,
      String email,
      String? userName,
      String? companyName,
      String? contactNumber,
      @TimestampConverter() Timestamp? registrationDate});
}

/// @nodoc
class _$RecruiterCopyWithImpl<$Res, $Val extends Recruiter>
    implements $RecruiterCopyWith<$Res> {
  _$RecruiterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recruiter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recruiterId = null,
    Object? email = null,
    Object? userName = freezed,
    Object? companyName = freezed,
    Object? contactNumber = freezed,
    Object? registrationDate = freezed,
  }) {
    return _then(_value.copyWith(
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: freezed == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecruiterImplCopyWith<$Res>
    implements $RecruiterCopyWith<$Res> {
  factory _$$RecruiterImplCopyWith(
          _$RecruiterImpl value, $Res Function(_$RecruiterImpl) then) =
      __$$RecruiterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String recruiterId,
      String email,
      String? userName,
      String? companyName,
      String? contactNumber,
      @TimestampConverter() Timestamp? registrationDate});
}

/// @nodoc
class __$$RecruiterImplCopyWithImpl<$Res>
    extends _$RecruiterCopyWithImpl<$Res, _$RecruiterImpl>
    implements _$$RecruiterImplCopyWith<$Res> {
  __$$RecruiterImplCopyWithImpl(
      _$RecruiterImpl _value, $Res Function(_$RecruiterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recruiter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recruiterId = null,
    Object? email = null,
    Object? userName = freezed,
    Object? companyName = freezed,
    Object? contactNumber = freezed,
    Object? registrationDate = freezed,
  }) {
    return _then(_$RecruiterImpl(
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: freezed == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RecruiterImpl implements _Recruiter {
  _$RecruiterImpl(
      {required this.recruiterId,
      required this.email,
      this.userName,
      this.companyName,
      this.contactNumber,
      @TimestampConverter() this.registrationDate});

  factory _$RecruiterImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecruiterImplFromJson(json);

  @override
  String recruiterId;
  @override
  String email;
  @override
  String? userName;
  @override
  String? companyName;
  @override
  String? contactNumber;
  @override
  @TimestampConverter()
  Timestamp? registrationDate;

  @override
  String toString() {
    return 'Recruiter(recruiterId: $recruiterId, email: $email, userName: $userName, companyName: $companyName, contactNumber: $contactNumber, registrationDate: $registrationDate)';
  }

  /// Create a copy of Recruiter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecruiterImplCopyWith<_$RecruiterImpl> get copyWith =>
      __$$RecruiterImplCopyWithImpl<_$RecruiterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecruiterImplToJson(
      this,
    );
  }
}

abstract class _Recruiter implements Recruiter {
  factory _Recruiter(
      {required String recruiterId,
      required String email,
      String? userName,
      String? companyName,
      String? contactNumber,
      @TimestampConverter() Timestamp? registrationDate}) = _$RecruiterImpl;

  factory _Recruiter.fromJson(Map<String, dynamic> json) =
      _$RecruiterImpl.fromJson;

  @override
  String get recruiterId;
  set recruiterId(String value);
  @override
  String get email;
  set email(String value);
  @override
  String? get userName;
  set userName(String? value);
  @override
  String? get companyName;
  set companyName(String? value);
  @override
  String? get contactNumber;
  set contactNumber(String? value);
  @override
  @TimestampConverter()
  Timestamp? get registrationDate;
  @TimestampConverter()
  set registrationDate(Timestamp? value);

  /// Create a copy of Recruiter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecruiterImplCopyWith<_$RecruiterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
