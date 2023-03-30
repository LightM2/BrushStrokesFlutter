import 'package:brush_strokes/models/pexels_api_client.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';

class CuratedPhotosRepository {
  CuratedPhotosRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<CuratedPhotos> getCuratedPhotos(int perPage) async {
    return await _apiClient.getCuratedPhotos(perPage);
  }
}
