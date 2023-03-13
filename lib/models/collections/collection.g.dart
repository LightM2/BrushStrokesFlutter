// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String,
      json['media_count'] as int,
      json['photos_count'] as int,
      json['videos_count'] as int,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'media_count': instance.mediaCount,
      'photos_count': instance.photosCount,
      'videos_count': instance.videosCount,
    };
