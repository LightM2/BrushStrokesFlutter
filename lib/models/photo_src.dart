import 'package:json_annotation/json_annotation.dart';

part 'photo_src.g.dart';

@JsonSerializable()
class PhotoSrc {
  PhotoSrc(
    this.original,
    this.large2X,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  );

  factory PhotoSrc.fromJson(Map<String, dynamic> json) =>
      _$PhotoSrcFromJson(json);

  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Map<String, dynamic> toJson() => _$PhotoSrcToJson(this);
}
