import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/bottom_nav_bar.dart';
import '../../../../core/theme/app_color.dart';
import '../widget/baegopa_timer_widget.dart';
import '../widget/dash_board_widget.dart';
import '../widget/fasting_mode_selector_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("단식"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed("TipPage");
            },
            icon: Icon(
              Icons.tips_and_updates_rounded,
              color: AppColor.KongBlue1,
            ),
          )
        ],
      ),
      body: const SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FastingModeSelectorWidget(),
            BeagopaTimerWidget(),
            Expanded(flex: 2, child: BeagopaButtonsWidget()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
