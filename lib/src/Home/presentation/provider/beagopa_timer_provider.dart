import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/enum/fasting_mode.dart';
import '../../data/model/fasting_record.dart';
import '../../domain/model/beagopa_timer_state.dart';
import 'fasting_mode_provider.dart';

part 'beagopa_timer_provider.g.dart';

@Riverpod(keepAlive: true)
class BeagopaTimer extends _$BeagopaTimer {
  @override
  BeagopaTimerState build() {
    final now = DateTime.now();
    return BeagopaTimerState(
      startTime: now,
      endTime: now,
      elapsedTime: Duration.zero,
      remainingTime: Duration.zero,
      isTimerRunning: false,
      timer: null,
      progress: 0.0,
    );
  }

  // 타이머 시작
  void startTimer() {
    if (state.startTime.isAfter(DateTime.now())) {
      return;
    }

    final fastingMode = ref.watch(fastingModeStateProvider);
    final endTime = _getEndTime(fastingMode);

    state = state.copyWith(
      endTime: endTime,
      remainingTime: _calculateRemainingTime(),
      elapsedTime: _calculateElapsedTime(),
      isTimerRunning: true,
      progress: 0.0,
    );

    _updateTimerState();

    state = state.copyWith(
      timer: Timer.periodic(const Duration(seconds: 1), (_) {
        _updateTimerState();
      }),
    );
  }

  // 타이머 멈춤
  void stopTimer() async {
    state.timer?.cancel();

    // 단식 시간 계산
    final fastingDuration = state.elapsedTime;

    final record = FastingRecord(
      date: DateTime.now(),
      fastingDuration: fastingDuration.inSeconds,
    );

    // 날짜를 key로 저장
    final box = await Hive.openBox<FastingRecord>('fastingRecordsBox');
    final dateKey = record.date.toIso8601String(); // ISO 8601 형식
    await box.put(dateKey, record);

    // 타이머 상태 초기화
    state = state.copyWith(
      isTimerRunning: false,
      timer: null,
      remainingTime: Duration.zero,
      progress: 0,
    );
  }

  // 타이머 상태 업데이트
  void _updateTimerState() {
    final now = DateTime.now();
    if (now.isBefore(state.endTime)) {
      final progress = getProgress(
        startTime: state.startTime,
        endTime: state.endTime,
      );
      state = state.copyWith(
        elapsedTime: now.difference(state.startTime),
        remainingTime: state.endTime.difference(now),
        progress: progress,
      );
    } else {
      stopTimer();
    }
  }

  // 남은 시간 계산
  Duration _calculateRemainingTime() {
    final now = DateTime.now();
    return state.startTime.isBefore(now)
        ? Duration.zero
        : state.startTime.difference(now);
  }

  // 진행된 시간 계산
  Duration _calculateElapsedTime() {
    final now = DateTime.now();
    return now.isBefore(state.startTime)
        ? Duration.zero
        : now.difference(state.startTime);
  }

  // fastingMode에 따른 endTime 계산
  DateTime _getEndTime(FastingMode mode) {
    final duration = getDurationForMode(mode);
    return state.startTime.add(Duration(hours: duration));
  }

  // 진행 상태 계산
  double getProgress({required DateTime startTime, required DateTime endTime}) {
    final now = DateTime.now();
    if (now.isAfter(startTime)) {
      if (now.isBefore(endTime)) {
        final elapsedTime = now.difference(startTime).inSeconds;
        final totalTime = endTime.difference(startTime).inSeconds;
        return elapsedTime / totalTime;
      } else {
        return 1.0;
      }
    }
    return 0.0;
  }

  // fastingMode에 따른 지속 시간 반환
  int getDurationForMode(FastingMode mode) {
    switch (mode) {
      case FastingMode.TWELVETWELVE:
        return 12;
      case FastingMode.SIXTEENEIGHT:
        return 16;
      case FastingMode.TWENTYFOUR:
        return 20;
      case FastingMode.FIVETWO:
        return 24;
    }
  }

  // 시작 시간 설정 및 초기화
  void setStartTime(DateTime newStartTime) {
    state = state.copyWith(
      startTime: newStartTime,
      remainingTime: Duration.zero,
      progress: 0,
    );
  }
}
