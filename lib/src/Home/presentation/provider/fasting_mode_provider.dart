import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/enum/fasting_mode.dart';

part 'fasting_mode_provider.g.dart';

@riverpod
class FastingModeState extends _$FastingModeState {
  @override
  FastingMode build() {
    return FastingMode.sixteenEight;
  }

  void changeMode(FastingMode newMode) {
    state = newMode;
  }
}
