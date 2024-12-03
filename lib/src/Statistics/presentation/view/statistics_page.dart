import 'package:flutter/material.dart';

import '../../../../core/router/bottom_nav_bar.dart';
import '../widget/fasting_data_list_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('통계'),
        centerTitle: false,
      ),
      body: const FastingDataListWidget(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
