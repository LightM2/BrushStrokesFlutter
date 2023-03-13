import 'package:brush_strokes/models/photos/photo_src.dart';
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
  @JsonKey(name: 'photographer_url')
  String photographerUrl;
  @JsonKey(name: 'photographer_id')
  int photographerId;
  @JsonKey(name: 'avg_color')
  String avgColor;
  PhotoSrc src;
  String alt;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
