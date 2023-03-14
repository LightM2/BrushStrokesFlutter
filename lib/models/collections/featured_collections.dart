import 'package:brush_strokes/models/collections/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'featured_collections.g.dart';

@JsonSerializable(explicitToJson: true)
class FeaturedCollections {
  FeaturedCollections(
    this.collections,
    this.page,
    this.perPage,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  );

  factory FeaturedCollections.fromJson(Map<String, dynamic> json) =>
      _$FeaturedCollectionsFromJson(json);

  List<Collection> collections;
  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'next_page')
  String? nextPage;
  @JsonKey(name: 'prev_page')
  String? prevPage;

  Map<String, dynamic> toJson() => _$FeaturedCollectionsToJson(this);
}
