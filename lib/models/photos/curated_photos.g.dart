// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curated_photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuratedPhotos _$CuratedPhotosFromJson(Map<String, dynamic> json) =>
    CuratedPhotos(
      json['page'] as int,
      json['per_page'] as int,
      (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_page'] as String?,
      json['prev_page'] as String?,
    );

Map<String, dynamic> _$CuratedPhotosToJson(CuratedPhotos instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'photos': instance.photos.map((e) => e.toJson()).toList(),
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
