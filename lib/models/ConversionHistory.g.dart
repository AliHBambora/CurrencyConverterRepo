// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConversionHistory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConversionHistoryAdapter extends TypeAdapter<ConversionHistory> {
  @override
  final int typeId = 1;

  @override
  ConversionHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConversionHistory()
      ..fromCurrencyName = fields[0] as String
      ..fromCurrencyCode = fields[1] as String
      ..toCurrencyName = fields[2] as String
      ..toCurrencyCode = fields[3] as String
      ..fromCurrencyAmount = fields[4] as double
      ..toCurrencyAmount = fields[5] as double
      ..conversionDate = fields[6] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ConversionHistory obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fromCurrencyName)
      ..writeByte(1)
      ..write(obj.fromCurrencyCode)
      ..writeByte(2)
      ..write(obj.toCurrencyName)
      ..writeByte(3)
      ..write(obj.toCurrencyCode)
      ..writeByte(4)
      ..write(obj.fromCurrencyAmount)
      ..writeByte(5)
      ..write(obj.toCurrencyAmount)
      ..writeByte(6)
      ..write(obj.conversionDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversionHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
