import 'package:brush_strokes/models/photos/photo_src.dart';
import 'package:brush_strokes/models/videos/video_author.dart';
import 'package:brush_strokes/models/videos/video_file.dart';
import 'package:brush_strokes/models/videos/video_picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media {
  Media(
    this.type,
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.duration,
    this.image,
    this.videoAuthor,
    this.videoFiles,
    this.videoPictures,
  );

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  String type;
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
  bool liked;
  int duration;
  String image;
  @JsonKey(name: 'user')
  VideoAuthor videoAuthor;
  @JsonKey(name: 'video_files')
  List<VideoFile> videoFiles;
  @JsonKey(name: 'video_pictures')
  List<VideoPicture> videoPictures;

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
