// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleInfoAdapter extends TypeAdapter<SaleInfo> {
  @override
  final int typeId = 3;

  @override
  SaleInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleInfo(
      retailPrice: fields[0] as Price?,
      buyLink: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SaleInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.retailPrice)
      ..writeByte(1)
      ..write(obj.buyLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
