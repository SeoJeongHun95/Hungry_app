import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beagopa_timer_state.freezed.dart';

@freezed
class BeagopaTimerState with _$BeagopaTimerState {
  factory BeagopaTimerState({
    required DateTime startTime,
    required DateTime endTime,
    required Duration remainingTime,
    @Default(false) bool isTimerRunning,
    required TimeOfDay selectedStartTime,
    required TimeOfDay selectedEndTime,
    Timer? timer,
  }) = _BeagopaTimerState;
}
