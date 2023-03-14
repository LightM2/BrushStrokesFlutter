import 'package:brush_strokes/models/photos/photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curated_photos.g.dart';

@JsonSerializable(explicitToJson: true)
class CuratedPhotos {
  CuratedPhotos(
    this.page,
    this.perPage,
    this.photos,
    this.nextPage,
    this.prevPage,
  );

  factory CuratedPhotos.fromJson(Map<String, dynamic> json) =>
      _$CuratedPhotosFromJson(json);

  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  List<Photo> photos;
  @JsonKey(name: 'next_page')
  String? nextPage;
  @JsonKey(name: 'prev_page')
  String? prevPage;

  Map<String, dynamic> toJson() => _$CuratedPhotosToJson(this);
}
