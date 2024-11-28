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

  // Future<void> _selectTime(BuildContext context, bool isStartTime) async {
  //   final initialTime = isStartTime ? _selectedStartTime : _selectedEndTime;
  //   final TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: initialTime,
  //   );
  //   if (newTime != null) {
  //     setState(() {
  //       if (isStartTime) {
  //         _selectedStartTime = newTime;
  //       } else {
  //         _selectedEndTime = newTime;
  //       }
  //     });
  //   }
  // }

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
          left: 50,
          child: SizedBox(
            child: Text(
              beagopaTimerState.isTimerRunning
                  ? "단식중 : ${_formatTime(beagopaTimerState.remainingTime)}"
                  : "배고파!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Positioned(
          top: 160,
          left: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // GestureDetector(
              //   onTap: () => _selectTime(context, true),
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
              //       _selectedStartTime.format(context),
              //       style: const TextStyle(fontSize: 18),
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () => _selectTime(context, false),
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
              //       _selectedEndTime.format(context),
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
