import 'dart:async';

import 'package:baegopa/src/Home/domain/model/beagopa_timer_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beagopa_timer_provider.g.dart';

@riverpod
class BeagopaTimer extends _$BeagopaTimer {
  @override
  BeagopaTimerState build() {
    final now = DateTime.now();
    return BeagopaTimerState(
      startTime: now,
      endTime: now,
      remainingTime: Duration.zero,
      isTimerRunning: false,
      selectedStartTime: const TimeOfDay(hour: 10, minute: 0),
      selectedEndTime: const TimeOfDay(hour: 18, minute: 0),
      timer: null,
    );
  }

  void startTimer() {
    final now = DateTime.now();

    final startTime = DateTime(
      now.year,
      now.month,
      now.day,
      state.selectedStartTime.hour,
      state.selectedStartTime.minute,
    );

    final endTime = DateTime(
      now.year,
      now.month,
      now.day,
      state.selectedEndTime.hour,
      state.selectedEndTime.minute,
    );

    final adjustedEndTime = endTime.isBefore(startTime)
        ? endTime.add(const Duration(days: 1))
        : endTime;

    state = state.copyWith(
      startTime: startTime,
      endTime: adjustedEndTime,
      remainingTime: startTime.difference(now).isNegative
          ? Duration.zero
          : startTime.difference(now),
      isTimerRunning: true,
    );

    _updateTimerState();

    state = state.copyWith(
      timer: Timer.periodic(const Duration(seconds: 1), (_) {
        _updateTimerState();
      }),
    );
  }

  void _updateTimerState() {
    final now = DateTime.now();
    if (now.isBefore(state.endTime)) {
      state = state.copyWith(
        remainingTime: state.endTime.difference(now),
      );
    } else {
      stopTimer();
    }
  }

  void stopTimer() {
    state.timer?.cancel();
    state = state.copyWith(
      isTimerRunning: false,
      timer: null,
      remainingTime: Duration.zero,
    );
  }

  void setStartTime(TimeOfDay newTime) {
    state = state.copyWith(selectedStartTime: newTime);
    stopTimer();
    startTimer();
  }

  // void setEndTime(TimeOfDay newTime) {
  //   state = state.copyWith(selectedEndTime: newTime);
  //   stopTimer();
  //   startTimer();
  // }
}
