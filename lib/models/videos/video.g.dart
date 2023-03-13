// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['id'] as int,
      json['width'] as int,
      json['height'] as int,
      json['url'] as String,
      json['image'] as String,
      json['duration'] as int,
      VideoAuthor.fromJson(json['user'] as Map<String, dynamic>),
      (json['video_files'] as List<dynamic>)
          .map((e) => VideoFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['video_pictures'] as List<dynamic>)
          .map((e) => VideoPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'image': instance.image,
      'duration': instance.duration,
      'user': instance.videoAuthor.toJson(),
      'video_files': instance.videoFiles.map((e) => e.toJson()).toList(),
      'video_pictures': instance.videoPictures.map((e) => e.toJson()).toList(),
    };
