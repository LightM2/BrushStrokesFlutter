// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoFile _$VideoFileFromJson(Map<String, dynamic> json) => VideoFile(
      json['id'] as int,
      json['quality'] as String,
      json['file_type'] as String,
      json['width'] as int,
      json['height'] as int,
      json['link'] as String,
    );

Map<String, dynamic> _$VideoFileToJson(VideoFile instance) => <String, dynamic>{
      'id': instance.id,
      'quality': instance.quality,
      'file_type': instance.fileType,
      'width': instance.width,
      'height': instance.height,
      'link': instance.link,
    };
