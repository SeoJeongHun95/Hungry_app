import 'dart:async';

import 'package:flutter/material.dart';

import 'progress_painter_widget.dart';

class BaegopaTimerWidget extends StatefulWidget {
  const BaegopaTimerWidget({super.key});

  @override
  _BaegopaTimerWidgetState createState() => _BaegopaTimerWidgetState();
}

class _BaegopaTimerWidgetState extends State<BaegopaTimerWidget> {
  late Timer _timer;
  late DateTime _startTime;
  late DateTime _endTime;
  late Duration _remainingTime;
  bool _isTimerRunning = false;

  // 시작 시간과 종료 시간을 설정할 수 있는 변수
  TimeOfDay _selectedStartTime = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _selectedEndTime = const TimeOfDay(hour: 24, minute: 0);

  // 원호 진행률을 계산하는 함수
  double getProgress() {
    final now = DateTime.now();

    // 현재 시간이 시작 시간을 지나면
    if (now.isAfter(_startTime)) {
      // 만약 현재 시간이 종료 시간을 지나지 않았다면
      if (now.isBefore(_endTime)) {
        final elapsedTime = now.difference(_startTime).inSeconds;
        final totalTime = _endTime.difference(_startTime).inSeconds;
        return elapsedTime / totalTime; // 진행률 계산
      } else {
        return 1.0; // 종료 시간이 지나면 100%
      }
    }
    return 0.0; // 시작 시간이 지나지 않았다면 0%
  }

  // 시간 포맷팅 (hh:mm:ss)
  String _formatTime(Duration duration) {
    return "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  // 시간 선택 다이얼로그 열기
  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final initialTime = isStartTime ? _selectedStartTime : _selectedEndTime;
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (newTime != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = newTime;
        } else {
          _selectedEndTime = newTime;
        }
      });
    }
  }

  // 타이머 시작
  void _startTimer() {
    final now = DateTime.now();
    _startTime = DateTime(now.year, now.month, now.day, _selectedStartTime.hour,
        _selectedStartTime.minute);
    _endTime = DateTime(now.year, now.month, now.day, _selectedEndTime.hour,
        _selectedEndTime.minute);

    // 종료 시간이 시작 시간보다 이른 경우, 종료 시간을 다음 날로 설정
    if (_endTime.isBefore(_startTime)) {
      _endTime = _endTime.add(const Duration(days: 1));
    }

    setState(() {
      // 현재 시간이 시작 시간을 지났다면 그 차이를 반영하여 시작
      final elapsedTime =
          now.isAfter(_startTime) ? now.difference(_startTime) : Duration.zero;
      _remainingTime = _endTime.difference(now).isNegative
          ? Duration.zero
          : _endTime.difference(now); // 종료 시간까지 남은 시간 계산
      _isTimerRunning = true;
    });

    // 타이머 시작
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();

      // 현재 시간이 시작 시간 이후면 진행 중인 시간을 반영
      if (now.isAfter(_startTime) && now.isBefore(_endTime)) {
        setState(() {
          _remainingTime = _endTime.difference(now);
        });
      } else if (now.isAfter(_endTime)) {
        _stopTimer(); // 종료 시간이 지나면 타이머 멈추기
      }
    });
  }

  // 타이머 정지
  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer(); // 앱이 실행되면 타이머 자동 시작
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _selectTime(context, true),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '단식 시작 : ${_selectedStartTime.format(context)}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _selectTime(context, false),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '단식 종료 : ${_selectedEndTime.format(context)}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: ProgressPainter(
                progress: getProgress(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _isTimerRunning ? "단식중 : ${_formatTime(_remainingTime)}" : "배고팡",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
