import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../Home/data/datasources/local_fasting_data.dart';
import '../../../Home/data/model/fasting_record.dart';

part 'fasting_record_data_provider.g.dart';

@riverpod
class FastingRecordData extends _$FastingRecordData {
  @override
  Future<List<FastingRecord>> build() async {
    final records = await getFastingRecords();
    return records;
  }
}
