import 'package:json_annotation/json_annotation.dart';

part 'video_author.g.dart';

@JsonSerializable()
class VideoAuthor {
  VideoAuthor(
    this.id,
    this.name,
    this.url,
  );

  factory VideoAuthor.fromJson(Map<String, dynamic> json) =>
      _$VideoAuthorFromJson(json);

  int id;
  String name;
  String url;

  Map<String, dynamic> toJson() => _$VideoAuthorToJson(this);
}
