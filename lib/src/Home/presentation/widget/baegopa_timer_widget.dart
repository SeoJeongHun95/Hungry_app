import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/beagopa_timer_provider.dart';
import 'progress_painter_widget.dart';

class BeagopaTimerWidget extends ConsumerStatefulWidget {
  const BeagopaTimerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BeagopaTimerWidgetState();
}

class _BeagopaTimerWidgetState extends ConsumerState<BeagopaTimerWidget> {
  final imgPath = "lib/core/img/akachan_nango.png";

  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(beagopaTimerProvider.notifier).startTimer();
    });
    _loadImage(imgPath);
  }

  Future<void> _loadImage(String imgPath) async {
    final data = await DefaultAssetBundle.of(context).load(imgPath);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    setState(() {
      _image = frame.image;
    });
  }

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

  String _formatTime(Duration duration) {
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final beagopaTimerState = ref.watch(beagopaTimerProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: ProgressPainter(
              progress: getProgress(
                startTime: beagopaTimerState.startTime,
                endTime: beagopaTimerState.endTime,
              ),
              image: _image,
              imageSize: 30.0,
            ),
          ),
        ),
        Positioned(
          top: 240,
          child: SizedBox(
            child: Text(
              beagopaTimerState.isTimerRunning
                  ? "단식중 : ${_formatTime(beagopaTimerState.remainingTime)}"
                  : "배고파!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          top: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: beagopaTimerState.selectedStartTime,
                  );
                  if (newTime != null) {
                    ref
                        .read(beagopaTimerProvider.notifier)
                        .setStartTime(newTime);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    beagopaTimerState.selectedStartTime.format(context),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              // 시작시간만 정하면 될거같아서 일단 삭제
              // GestureDetector(
              //   onTap: () async {
              //     final TimeOfDay? newTime = await showTimePicker(
              //       context: context,
              //       initialTime: beagopaTimerState.selectedEndTime,
              //     );
              //     if (newTime != null) {
              //       ref.read(beagopaTimerProvider.notifier).setEndTime(newTime);
              //     }
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 10.0,
              //       horizontal: 20.0,
              //     ),
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.blue),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Text(
              //       beagopaTimerState.selectedEndTime.format(context),
              //       style: const TextStyle(fontSize: 18),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
