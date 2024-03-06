// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReliveAdapter extends TypeAdapter<Relive> {
  @override
  final int typeId = 16;

  @override
  Relive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Relive(
      slotnumber: fields[0] as int,
      id: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Relive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.slotnumber)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReliveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
