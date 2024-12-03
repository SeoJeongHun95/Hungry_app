import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'fasting_record.freezed.dart';
part 'fasting_record.g.dart';

@HiveType(typeId: 0)
@freezed
class FastingRecord with _$FastingRecord {
  factory FastingRecord({
    @HiveField(0) required DateTime date,
    @HiveField(1) required int fastingDuration,
  }) = _FastingRecord;
}
