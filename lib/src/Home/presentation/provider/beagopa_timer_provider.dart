import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beagopa_timer_provider.g.dart';

@riverpod
class BeagopaTimer extends _$BeagopaTimer {
  @override
  Map<String, dynamic> build() {
    return {
      "timer": null,
      "startTime": DateTime.now(),
      "endTime": DateTime.now(),
      "remainingTime": Duration.zero,
      "isTimerRunning": false,
      "selectedStartTime": const TimeOfDay(hour: 10, minute: 0),
      "selectedEndTime": const TimeOfDay(hour: 18, minute: 0),
    };
  }

  void startTimer() {
    final now = DateTime.now();

    // 시작 시간과 종료 시간 계산
    final startTime = DateTime(
      now.year,
      now.month,
      now.day,
      state["selectedStartTime"].hour,
      state["selectedStartTime"].minute,
    );

    final endTime = DateTime(
      now.year,
      now.month,
      now.day,
      state["selectedEndTime"].hour,
      state["selectedEndTime"].minute,
    );

    final adjustedStartTime = endTime.isBefore(startTime)
        ? startTime.add(const Duration(days: 1))
        : startTime;

    // 상태 초기화
    state = {
      ...state,
      "startTime": adjustedStartTime,
      "endTime": endTime,
      "remainingTime": adjustedStartTime.difference(now).isNegative
          ? Duration.zero
          : adjustedStartTime.difference(now),
      "isTimerRunning": true,
    };

    // 상태를 즉시 반영
    _updateTimerState();

    // 타이머 시작
    state["timer"] = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimerState();
    });
  }

  void _updateTimerState() {
    final now = DateTime.now();

    if (now.isBefore(state["endTime"])) {
      // 상태 갱신
      state = {
        ...state,
        "remainingTime": state["endTime"].difference(now),
      };
    } else {
      // 타이머 종료
      stopTimer();
    }
  }

  void stopTimer() {
    if (state["timer"] != null) {
      state["timer"].cancel();
      state["timer"] = null;
    }

    // 타이머 종료 상태 갱신
    state = {
      ...state,
      "isTimerRunning": false,
      "remainingTime": Duration.zero,
    };
  }
}
