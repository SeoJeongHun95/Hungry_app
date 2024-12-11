import 'package:hive/hive.dart';

import '../model/fasting_record.dart';

Future<List<FastingRecord>> getFastingRecords() async {
  final box = await Hive.openBox<FastingRecord>('fastingRecordsBox');
  return box.isNotEmpty ? box.values.toList() : [];
}
