// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beagopa_timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BeagopaTimerState {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  Duration get remainingTime => throw _privateConstructorUsedError;
  bool get isTimerRunning => throw _privateConstructorUsedError;
  TimeOfDay get selectedStartTime => throw _privateConstructorUsedError;
  TimeOfDay get selectedEndTime => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  /// Create a copy of BeagopaTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeagopaTimerStateCopyWith<BeagopaTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeagopaTimerStateCopyWith<$Res> {
  factory $BeagopaTimerStateCopyWith(
          BeagopaTimerState value, $Res Function(BeagopaTimerState) then) =
      _$BeagopaTimerStateCopyWithImpl<$Res, BeagopaTimerState>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      Duration remainingTime,
      bool isTimerRunning,
      TimeOfDay selectedStartTime,
      TimeOfDay selectedEndTime,
      Timer? timer});
}

/// @nodoc
class _$BeagopaTimerStateCopyWithImpl<$Res, $Val extends BeagopaTimerState>
    implements $BeagopaTimerStateCopyWith<$Res> {
  _$BeagopaTimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BeagopaTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? remainingTime = null,
    Object? isTimerRunning = null,
    Object? selectedStartTime = null,
    Object? selectedEndTime = null,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isTimerRunning: null == isTimerRunning
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStartTime: null == selectedStartTime
          ? _value.selectedStartTime
          : selectedStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      selectedEndTime: null == selectedEndTime
          ? _value.selectedEndTime
          : selectedEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeagopaTimerStateImplCopyWith<$Res>
    implements $BeagopaTimerStateCopyWith<$Res> {
  factory _$$BeagopaTimerStateImplCopyWith(_$BeagopaTimerStateImpl value,
          $Res Function(_$BeagopaTimerStateImpl) then) =
      __$$BeagopaTimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      Duration remainingTime,
      bool isTimerRunning,
      TimeOfDay selectedStartTime,
      TimeOfDay selectedEndTime,
      Timer? timer});
}

/// @nodoc
class __$$BeagopaTimerStateImplCopyWithImpl<$Res>
    extends _$BeagopaTimerStateCopyWithImpl<$Res, _$BeagopaTimerStateImpl>
    implements _$$BeagopaTimerStateImplCopyWith<$Res> {
  __$$BeagopaTimerStateImplCopyWithImpl(_$BeagopaTimerStateImpl _value,
      $Res Function(_$BeagopaTimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BeagopaTimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? remainingTime = null,
    Object? isTimerRunning = null,
    Object? selectedStartTime = null,
    Object? selectedEndTime = null,
    Object? timer = freezed,
  }) {
    return _then(_$BeagopaTimerStateImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remainingTime: null == remainingTime
          ? _value.remainingTime
          : remainingTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      isTimerRunning: null == isTimerRunning
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedStartTime: null == selectedStartTime
          ? _value.selectedStartTime
          : selectedStartTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      selectedEndTime: null == selectedEndTime
          ? _value.selectedEndTime
          : selectedEndTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$BeagopaTimerStateImpl implements _BeagopaTimerState {
  _$BeagopaTimerStateImpl(
      {required this.startTime,
      required this.endTime,
      required this.remainingTime,
      this.isTimerRunning = false,
      required this.selectedStartTime,
      required this.selectedEndTime,
      this.timer});

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final Duration remainingTime;
  @override
  @JsonKey()
  final bool isTimerRunning;
  @override
  final TimeOfDay selectedStartTime;
  @override
  final TimeOfDay selectedEndTime;
  @override
  final Timer? timer;

  @override
  String toString() {
    return 'BeagopaTimerState(startTime: $startTime, endTime: $endTime, remainingTime: $remainingTime, isTimerRunning: $isTimerRunning, selectedStartTime: $selectedStartTime, selectedEndTime: $selectedEndTime, timer: $timer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeagopaTimerStateImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.remainingTime, remainingTime) ||
                other.remainingTime == remainingTime) &&
            (identical(other.isTimerRunning, isTimerRunning) ||
                other.isTimerRunning == isTimerRunning) &&
            (identical(other.selectedStartTime, selectedStartTime) ||
                other.selectedStartTime == selectedStartTime) &&
            (identical(other.selectedEndTime, selectedEndTime) ||
                other.selectedEndTime == selectedEndTime) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime,
      remainingTime, isTimerRunning, selectedStartTime, selectedEndTime, timer);

  /// Create a copy of BeagopaTimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeagopaTimerStateImplCopyWith<_$BeagopaTimerStateImpl> get copyWith =>
      __$$BeagopaTimerStateImplCopyWithImpl<_$BeagopaTimerStateImpl>(
          this, _$identity);
}

abstract class _BeagopaTimerState implements BeagopaTimerState {
  factory _BeagopaTimerState(
      {required final DateTime startTime,
      required final DateTime endTime,
      required final Duration remainingTime,
      final bool isTimerRunning,
      required final TimeOfDay selectedStartTime,
      required final TimeOfDay selectedEndTime,
      final Timer? timer}) = _$BeagopaTimerStateImpl;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  Duration get remainingTime;
  @override
  bool get isTimerRunning;
  @override
  TimeOfDay get selectedStartTime;
  @override
  TimeOfDay get selectedEndTime;
  @override
  Timer? get timer;

  /// Create a copy of BeagopaTimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeagopaTimerStateImplCopyWith<_$BeagopaTimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
