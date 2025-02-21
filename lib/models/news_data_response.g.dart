// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsDataResponseAdapter extends TypeAdapter<NewsDataResponse> {
  @override
  final int typeId = 4;

  @override
  NewsDataResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsDataResponse(
      status: fields[0] as String?,
      code: fields[1] as String?,
      message: fields[2] as String?,
      totalResults: fields[3] as int?,
      articles: (fields[4] as List?)?.cast<Articles>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsDataResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.totalResults)
      ..writeByte(4)
      ..write(obj.articles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsDataResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
