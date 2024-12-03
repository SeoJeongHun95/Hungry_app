// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fasting_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FastingRecordAdapter extends TypeAdapter<FastingRecord> {
  @override
  final int typeId = 0;

  @override
  FastingRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FastingRecord(
      date: fields[0] as DateTime,
      fastingDuration: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FastingRecord obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.fastingDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FastingRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
