import 'package:brush_strokes/models/photo_src.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  Photo(
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.alt,
  );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  PhotoSrc src;
  String alt;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
