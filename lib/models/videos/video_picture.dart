import 'package:json_annotation/json_annotation.dart';

part 'video_picture.g.dart';

@JsonSerializable()
class VideoPicture {
  VideoPicture(
    this.id,
    this.picture,
    this.nr,
  );

  factory VideoPicture.fromJson(Map<String, dynamic> json) => _$VideoPictureFromJson(json);

  int id;
  String picture;
  int nr;

  Map<String, dynamic> toJson() => _$VideoPictureToJson(this);
}
