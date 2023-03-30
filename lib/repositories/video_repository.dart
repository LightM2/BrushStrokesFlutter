import 'package:brush_strokes/models/pexels_api_client.dart';
import 'package:brush_strokes/models/videos/video.dart';

class VideoRepository {
  VideoRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<Video> getVideo(int id) async {
    return await _apiClient.getVideo(id);
  }
}
