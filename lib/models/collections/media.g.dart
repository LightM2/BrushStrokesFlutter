// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      json['type'] as String,
      json['id'] as int,
      json['width'] as int,
      json['height'] as int,
      json['url'] as String,
      json['photographer'] as String,
      json['photographer_url'] as String,
      json['photographer_id'] as int,
      json['avg_color'] as String,
      PhotoSrc.fromJson(json['src'] as Map<String, dynamic>),
      json['liked'] as bool,
      json['duration'] as int,
      json['image'] as String,
      VideoAuthor.fromJson(json['user'] as Map<String, dynamic>),
      (json['video_files'] as List<dynamic>)
          .map((e) => VideoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['video_pictures'] as List<dynamic>)
          .map((e) => VideoPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographerUrl,
      'photographer_id': instance.photographerId,
      'avg_color': instance.avgColor,
      'src': instance.src.toJson(),
      'liked': instance.liked,
      'duration': instance.duration,
      'image': instance.image,
      'user': instance.videoAuthor.toJson(),
      'video_files': instance.videoFiles.map((e) => e.toJson()).toList(),
      'video_pictures': instance.videoPictures.map((e) => e.toJson()).toList(),
    };
