// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      json['id'] as int,
      json['width'] as int,
      json['height'] as int,
      json['url'] as String,
      json['photographer'] as String,
      json['photographerUrl'] as String,
      json['photographerId'] as int,
      json['avgColor'] as String,
      PhotoSrc.fromJson(json['src'] as Map<String, dynamic>),
      json['alt'] as String,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographerUrl': instance.photographerUrl,
      'photographerId': instance.photographerId,
      'avgColor': instance.avgColor,
      'src': instance.src.toJson(),
      'alt': instance.alt,
    };
