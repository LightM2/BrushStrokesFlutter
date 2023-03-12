// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuratedPhotos _$CuratedPhotosFromJson(Map<String, dynamic> json) =>
    CuratedPhotos(
      json['page'] as int,
      json['perPage'] as int,
      (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['nextPage'] as String,
    );

Map<String, dynamic> _$CuratedPhotosToJson(CuratedPhotos instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      'nextPage': instance.nextPage,
    };
