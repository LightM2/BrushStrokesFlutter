// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedCollections _$FeaturedCollectionsFromJson(Map<String, dynamic> json) =>
    FeaturedCollections(
      (json['collections'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
      json['per_page'] as int,
      json['total_results'] as int,
      json['next_page'] as String?,
      json['prev_page'] as String?,
    );

Map<String, dynamic> _$FeaturedCollectionsToJson(
        FeaturedCollections instance) =>
    <String, dynamic>{
      'collections': instance.collections.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
