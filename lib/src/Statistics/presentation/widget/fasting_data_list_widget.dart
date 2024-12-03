import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/fasting_record_data_provider.dart';

class FastingDataListWidget extends ConsumerWidget {
  const FastingDataListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fastingData = ref.watch(fastingRecordDataProvider);

    return fastingData.when(
      data: (data) {
        return ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) => ListTile(
            title: Text("${data[index].date}"),
            subtitle: Text("${data[index].fastingDuration} 초"),
          ),
          separatorBuilder: (context, index) => const Divider(),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(
          'An error occurred: ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
