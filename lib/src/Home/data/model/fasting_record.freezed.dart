// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fasting_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FastingRecord _$FastingRecordFromJson(Map<String, dynamic> json) {
  return _FastingRecord.fromJson(json);
}

/// @nodoc
mixin _$FastingRecord {
  @HiveField(0)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(1)
  Duration get fastingDuration => throw _privateConstructorUsedError;

  /// Serializes this FastingRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FastingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FastingRecordCopyWith<FastingRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FastingRecordCopyWith<$Res> {
  factory $FastingRecordCopyWith(
          FastingRecord value, $Res Function(FastingRecord) then) =
      _$FastingRecordCopyWithImpl<$Res, FastingRecord>;
  @useResult
  $Res call(
      {@HiveField(0) DateTime date, @HiveField(1) Duration fastingDuration});
}

/// @nodoc
class _$FastingRecordCopyWithImpl<$Res, $Val extends FastingRecord>
    implements $FastingRecordCopyWith<$Res> {
  _$FastingRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FastingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? fastingDuration = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fastingDuration: null == fastingDuration
          ? _value.fastingDuration
          : fastingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FastingRecordImplCopyWith<$Res>
    implements $FastingRecordCopyWith<$Res> {
  factory _$$FastingRecordImplCopyWith(
          _$FastingRecordImpl value, $Res Function(_$FastingRecordImpl) then) =
      __$$FastingRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) DateTime date, @HiveField(1) Duration fastingDuration});
}

/// @nodoc
class __$$FastingRecordImplCopyWithImpl<$Res>
    extends _$FastingRecordCopyWithImpl<$Res, _$FastingRecordImpl>
    implements _$$FastingRecordImplCopyWith<$Res> {
  __$$FastingRecordImplCopyWithImpl(
      _$FastingRecordImpl _value, $Res Function(_$FastingRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of FastingRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? fastingDuration = null,
  }) {
    return _then(_$FastingRecordImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fastingDuration: null == fastingDuration
          ? _value.fastingDuration
          : fastingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FastingRecordImpl implements _FastingRecord {
  _$FastingRecordImpl(
      {@HiveField(0) required this.date,
      @HiveField(1) required this.fastingDuration});

  factory _$FastingRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$FastingRecordImplFromJson(json);

  @override
  @HiveField(0)
  final DateTime date;
  @override
  @HiveField(1)
  final Duration fastingDuration;

  @override
  String toString() {
    return 'FastingRecord(date: $date, fastingDuration: $fastingDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FastingRecordImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.fastingDuration, fastingDuration) ||
                other.fastingDuration == fastingDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, fastingDuration);

  /// Create a copy of FastingRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FastingRecordImplCopyWith<_$FastingRecordImpl> get copyWith =>
      __$$FastingRecordImplCopyWithImpl<_$FastingRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FastingRecordImplToJson(
      this,
    );
  }
}

abstract class _FastingRecord implements FastingRecord {
  factory _FastingRecord(
          {@HiveField(0) required final DateTime date,
          @HiveField(1) required final Duration fastingDuration}) =
      _$FastingRecordImpl;

  factory _FastingRecord.fromJson(Map<String, dynamic> json) =
      _$FastingRecordImpl.fromJson;

  @override
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  Duration get fastingDuration;

  /// Create a copy of FastingRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FastingRecordImplCopyWith<_$FastingRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
