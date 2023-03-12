import 'package:brush_strokes/models/photo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'curated_photos.g.dart';

@JsonSerializable(explicitToJson: true)
class CuratedPhotos {
  CuratedPhotos(
    this.page,
    this.perPage,
    this.photos,
    this.nextPage,
  );

  factory CuratedPhotos.fromJson(Map<String, dynamic> json) =>
      _$CuratedPhotosFromJson(json);

  int page;
  int perPage;
  List<Photo> photos;
  String nextPage;

  Map<String, dynamic> toJson() => _$CuratedPhotosToJson(this);
}
