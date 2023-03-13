import 'package:brush_strokes/models/collections/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_media.g.dart';

@JsonSerializable(explicitToJson: true)
class CollectionMedia {
  CollectionMedia(
    this.id,
    this.media,
    this.page,
    this.perPage,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  );

  factory CollectionMedia.fromJson(Map<String, dynamic> json) => _$CollectionMediaFromJson(json);

  String id;
  List<Media> media;
  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'next_page')
  String? nextPage;
  @JsonKey(name: 'prev_page')
  String? prevPage;

  Map<String, dynamic> toJson() => _$CollectionMediaToJson(this);
}