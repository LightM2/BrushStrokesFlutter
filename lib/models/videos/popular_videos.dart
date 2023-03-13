import 'package:brush_strokes/models/videos/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_videos.g.dart';

@JsonSerializable(explicitToJson: true)
class PopularVideos {
  PopularVideos(
    this.page,
    this.perPage,
    this.totalResults,
    this.url,
    this.videos,
  );

  factory PopularVideos.fromJson(Map<String, dynamic> json) => _$PopularVideosFromJson(json);

  int page;
  @JsonKey(name: 'per_page')
  int perPage;
  @JsonKey(name: 'total_results')
  int totalResults;
  String url;
  List<Video> videos;
  @JsonKey(name: 'next_page')
  String? nextPage;
  @JsonKey(name: 'prev_page')
  String? prevPage;

  Map<String, dynamic> toJson() => _$PopularVideosToJson(this);
}
