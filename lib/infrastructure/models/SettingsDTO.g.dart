// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SettingsDTO.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsDTOAdapter extends TypeAdapter<SettingsDTO> {
  @override
  final int typeId = 0;

  @override
  SettingsDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsDTO(
      isLightMode: fields[0] as bool,
      scaleForFontSize: fields[1] as double,
      localeCode: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isLightMode)
      ..writeByte(1)
      ..write(obj.scaleForFontSize)
      ..writeByte(2)
      ..write(obj.localeCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
