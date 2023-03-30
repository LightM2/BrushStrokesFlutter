import 'package:brush_strokes/models/collections/collection_media.dart';
import 'package:brush_strokes/models/pexels_api_client.dart';

class CollectionMediaRepository {
  CollectionMediaRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<CollectionMedia> getCollectionMedia(int id) async {
    return await _apiClient.getCollectionMedia(id);
  }
}
