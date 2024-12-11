import 'package:baegopa/src/Statistics/presentation/widget/fasting_calender_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/router/bottom_nav_bar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        scrolledUnderElevation: 0,
        title: const Text('통계'),
        centerTitle: false,
      ),
      body: const SafeArea(
        child: Column(
          children: [
            FastingCalenderWidget(),
            // Expanded(child: FastingDataListWidget()),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
