import 'package:brush_strokes/models/videos/video_author.dart';
import 'package:brush_strokes/models/videos/video_file.dart';
import 'package:brush_strokes/models/videos/video_picture.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable(explicitToJson: true)
class Video {
  Video(
    this.id,
    this.width,
    this.height,
    this.url,
    this.image,
    this.duration,
    this.videoAuthor,
    this.videoFiles,
    this.videoPictures,
  );

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  int id;
  int width;
  int height;
  String url;
  String image;
  int duration;
  @JsonKey(name: 'user')
  VideoAuthor videoAuthor;
  @JsonKey(name: 'video_files')
  List<VideoFile> videoFiles;
  @JsonKey(name: 'video_pictures')
  List<VideoPicture> videoPictures;

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
