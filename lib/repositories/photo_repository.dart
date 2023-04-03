import 'package:brush_strokes/models/pexels_api_client.dart';
import 'package:brush_strokes/models/photos/photo.dart';

class PhotoRepository {
  PhotoRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<Photo> getPhoto(int id) async {
    return await _apiClient.getPhoto(id);
  }
}
