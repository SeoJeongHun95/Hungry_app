import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enum/fasting_mode.dart';
import '../provider/fasting_mode_provider.dart';

class FastingModeSelectorWidget extends ConsumerWidget {
  const FastingModeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fastingMode = ref.watch(fastingModeStateProvider);

    return DropdownButton<FastingMode>(
      value: fastingMode,
      onChanged: (FastingMode? newMode) {
        if (newMode != null) {
          ref.read(fastingModeStateProvider.notifier).changeMode(newMode);
        }
      },
      items: FastingMode.values.map((FastingMode mode) {
        return DropdownMenuItem<FastingMode>(
          value: mode,
          child: Text(
            mode.str,
            // mode.toString().split('.').last,
          ), // 열거형 값 문자열만 출력
        );
      }).toList(),
    );
  }
}
