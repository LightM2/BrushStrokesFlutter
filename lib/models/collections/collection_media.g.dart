// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionMedia _$CollectionMediaFromJson(Map<String, dynamic> json) =>
    CollectionMedia(
      json['id'] as String,
      (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
      json['per_page'] as int,
      json['total_results'] as int,
      json['next_page'] as String?,
      json['prev_page'] as String?,
    );

Map<String, dynamic> _$CollectionMediaToJson(CollectionMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media': instance.media.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
