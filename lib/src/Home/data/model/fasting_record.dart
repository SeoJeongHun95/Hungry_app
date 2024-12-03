import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fasting_record.freezed.dart';
part 'fasting_record.g.dart';

@HiveType(typeId: 1)
@freezed
class FastingRecord with _$FastingRecord {
  factory FastingRecord({
    @HiveField(0) required DateTime date,
    @HiveField(1) required Duration fastingDuration,
  }) = _FastingRecord;

  factory FastingRecord.fromJson(Map<String, dynamic> json) =>
      _$FastingRecordFromJson(json);
}
