import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../provider/beagopa_timer_provider.dart';

class BeagopaButtonsWidget extends ConsumerWidget {
  const BeagopaButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beagopaTimerState = ref.watch(beagopaTimerProvider);

    return beagopaTimerState.isTimerRunning
        ? const AfterFastingWidget()
        : const BeforeFastingWidget();
  }
}

class BeforeFastingWidget extends ConsumerWidget {
  const BeforeFastingWidget({
    super.key,
  });

  String formatTo12Hour(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beagopaTimerState = ref.watch(beagopaTimerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "단식 시작 시간",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () async {
                final now = DateTime.now();
                final TimeOfDay? pickedTime = await showTimePicker(
                  initialEntryMode: TimePickerEntryMode.dial,
                  cancelText: "취소",
                  confirmText: "적용",
                  helpText: "시작 시간을 선택해 주세요.",
                  context: context,
                  // initialTime: beagopaTimerState.selectedStartTime,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  ref.read(beagopaTimerProvider.notifier).setStartTime(
                        DateTime(
                          now.year,
                          now.month,
                          now.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        ),
                      );
                }
              },
              child: Text(
                formatTo12Hour(beagopaTimerState.startTime),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            ref.read(beagopaTimerProvider.notifier).startTimer();
          },
          child: Text(
            "단식시작",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class AfterFastingWidget extends ConsumerWidget {
  const AfterFastingWidget({super.key});

  String _formatTime(Duration duration) {
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();

    String timeString = "${dateTime.hour}시";

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      if (dateTime.minute != 0) {
        timeString += " ${dateTime.minute}분";
      }
      return "오늘 $timeString";
    } else if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day + 1) {
      if (dateTime.minute != 0) {
        timeString += " ${dateTime.minute}분";
      }
      return "내일 $timeString";
    } else {
      if (dateTime.minute != 0) {
        timeString += " ${dateTime.minute}분";
      }
      return "${dateTime.year}-${dateTime.month}-${dateTime.day} $timeString";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beagopaTimerState = ref.watch(beagopaTimerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "lib/core/img/lottie/hourglass.json",
                  width: 64,
                  height: 64,
                ),
                SizedBox(
                  width: 160,
                  child: Center(
                    child: Text(
                      _formatTime(beagopaTimerState.remainingTime),
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
                Container(width: 64)
              ],
            ),
            Text(
              _formatTime(beagopaTimerState.elapsedTime),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            ref.read(beagopaTimerProvider.notifier).stopTimer();
          },
          child: Text(
            "단식종료",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Column(
          children: [
            Text("시작시간 ${_formatDateTime(beagopaTimerState.startTime)}"),
            Text("종료시간 ${_formatDateTime(beagopaTimerState.endTime)}"),
          ],
        )
      ],
    );
  }
}
