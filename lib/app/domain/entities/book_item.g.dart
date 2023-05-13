// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookItemAdapter extends TypeAdapter<BookItem> {
  @override
  final int typeId = 0;

  @override
  BookItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookItem(
      kind: fields[0] as String?,
      id: fields[1] as String?,
      etag: fields[2] as String?,
      selfLink: fields[3] as String?,
      volumeInfo: fields[4] as VolumeInfo?,
      saleInfo: fields[5] as SaleInfo?,
    );
  }

  @override
  void write(BinaryWriter writer, BookItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.etag)
      ..writeByte(3)
      ..write(obj.selfLink)
      ..writeByte(4)
      ..write(obj.volumeInfo)
      ..writeByte(5)
      ..write(obj.saleInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
