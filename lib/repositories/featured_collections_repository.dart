import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:brush_strokes/models/pexels_api_client.dart';

class FeaturedCollectionsRepository {
  FeaturedCollectionsRepository({PexelsApiClient? apiClient})
      : _apiClient = apiClient ?? PexelsApiClient();
  final PexelsApiClient _apiClient;

  Future<FeaturedCollections> getFeaturedCollections() async {
    return await _apiClient.getFeaturedCollections();
  }
}
