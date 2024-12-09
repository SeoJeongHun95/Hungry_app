import 'package:baegopa/src/Home/presentation/provider/fasting_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/enum/fasting_mode.dart';
import '../../../Home/data/model/fasting_record.dart';
import '../provider/fasting_record_data_provider.dart';

class FastingCalenderWidget extends ConsumerStatefulWidget {
  const FastingCalenderWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FastingCalenderWidgetState();
}

class _FastingCalenderWidgetState extends ConsumerState<FastingCalenderWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final fastingDataAsync = ref.watch(fastingRecordDataProvider);
    final fastingMode = ref.watch(fastingModeStateProvider);

    return TableCalendar(
      locale: 'ko_KR',
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(2099, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      availableGestures: AvailableGestures.horizontalSwipe,
      eventLoader: (day) {
        return fastingDataAsync.when(
          data: (fastingData) {
            return fastingData
                .where((element) => isSameDay(element.date, day))
                .toList();
          },
          loading: () => [],
          error: (error, stackTrace) => [],
        );
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, events) {
          final fastingRecords = events.cast<FastingRecord>();

          if (fastingRecords.isEmpty) {
            return null;
          }

          double totFastingTime = 0.0;
          for (final record in fastingRecords) {
            totFastingTime += record.fastingDuration;
          }

          double progress = 0.0;
          switch (fastingMode) {
            case FastingMode.TWELVETWELVE:
              progress = totFastingTime / (12 * 60 * 60); // 12시간
              break;
            case FastingMode.SIXTEENEIGHT:
              progress = totFastingTime / (16 * 60 * 60); // 16시간
              break;
            case FastingMode.TWENTYFOUR:
              progress = totFastingTime / (20 * 60 * 60); // 20시간
              break;
            case FastingMode.FIVETWO:
              progress = totFastingTime / (24 * 60 * 60); // 24시간
              break;
          }

          progress = (progress * 100).clamp(0.0, 100.0);
          return Text(
            "${progress.toStringAsFixed(0)}%",
            style: TextStyle(
              color: progress >= 100.0 ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          return ;
        },
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      // onDaySelected: (selectedDay, focusedDay) {
      //   if (!isSameDay(_selectedDay, selectedDay)) {
      //     setState(() {
      //       _selectedDay = selectedDay;
      //       _focusedDay = focusedDay;
      //     });
      //   }
      // },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
