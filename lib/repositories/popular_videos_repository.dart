import 'package:brush_strokes/models/pexels_api_client.dart';
import 'package:brush_strokes/models/videos/popular_videos.dart';

class PopularVideosRepository {
  PopularVideosRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<PopularVideos> getPopularVideos() async {
    return await _apiClient.getPopularVideos();
  }
}
