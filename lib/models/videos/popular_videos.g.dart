// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularVideos _$PopularVideosFromJson(Map<String, dynamic> json) =>
    PopularVideos(
      json['page'] as int,
      json['per_page'] as int,
      json['total_results'] as int,
      json['url'] as String,
      (json['videos'] as List<dynamic>)
          .map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..nextPage = json['next_page'] as String?
      ..prevPage = json['prev_page'] as String?;

Map<String, dynamic> _$PopularVideosToJson(PopularVideos instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'url': instance.url,
      'videos': instance.videos.map((e) => e.toJson()).toList(),
      'next_page': instance.nextPage,
      'prev_page': instance.prevPage,
    };
