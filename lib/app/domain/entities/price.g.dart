// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 4;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price(
      amount: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
