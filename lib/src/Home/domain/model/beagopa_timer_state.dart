import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'beagopa_timer_state.freezed.dart';

@freezed
class BeagopaTimerState with _$BeagopaTimerState {
  factory BeagopaTimerState({
    required DateTime startTime,
    required DateTime endTime,
    required Duration remainingTime,
    required Duration elapsedTime,
    @Default(false) bool isTimerRunning,
    @Default(0) double progress,
    Timer? timer,
  }) = _BeagopaTimerState;
}
