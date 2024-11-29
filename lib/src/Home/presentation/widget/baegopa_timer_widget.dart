import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enum/fasting_mode.dart';
import '../provider/beagopa_timer_provider.dart';
import 'progress_painter_widget.dart';

class BeagopaTimerWidget extends ConsumerStatefulWidget {
  const BeagopaTimerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BeagopaTimerWidgetState();
}

class _BeagopaTimerWidgetState extends ConsumerState<BeagopaTimerWidget> {
  final imgPath = "lib/core/img/bab.png";
  FastingMode selectedMode = FastingMode.sixteenEight;

  ui.Image? _image;

  @override
  void initState() {
    super.initState();

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

  @override
  Widget build(BuildContext context) {
    final beagopaTimerState = ref.watch(beagopaTimerProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        //프로그레스
        SizedBox(
          width: 320,
          height: 320,
          child: CustomPaint(
            painter: ProgressPainter(
              progress: beagopaTimerState.progress,
              image: _image,
              imageSize: 30.0,
              strokeWidth: 10,
            ),
          ),
        ),
        Positioned(
          top: 60,
          child: Column(children: [
            Text(
              beagopaTimerState.isTimerRunning ? "지금은 단식 중이에요" : "지금은 충전 중이에요",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              beagopaTimerState.isTimerRunning
                  ? "lib/core/img/noeat_baby.png"
                  : "lib/core/img/eat_baby.png",
              width: 160,
            )
          ]),
        ),
      ],
    );
  }
}
