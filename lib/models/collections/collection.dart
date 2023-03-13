import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  Collection(
    this.id,
    this.title,
    this.description,
    this.mediaCount,
    this.photosCount,
    this.videosCount,
  );

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  String id;
  String title;
  String description;
  @JsonKey(name: 'media_count')
  int mediaCount;
  @JsonKey(name: 'photos_count')
  int photosCount;
  @JsonKey(name: 'videos_count')
  int videosCount;

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
