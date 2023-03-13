import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';
import 'package:http/http.dart' as http;

class PexelsClient {
  static const baseURL = 'https://api.pexels.com/v1';

  Future<CuratedPhotos> getCuratedPhotos() async {
    const curatedPhotosEndpoint = '$baseURL/curated?per_page=5';
    final response = await http.get(
      Uri.parse(curatedPhotosEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return CuratedPhotos.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load curated photos ${convert.jsonDecode(response.body)}');
    }
  }

  Future<FeaturedCollections> getFeaturedCollections() async {
    const featuredCollectionsEndpoint = '$baseURL/collections/featured?per_page=5';
    final response = await http.get(
      Uri.parse(featuredCollectionsEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return FeaturedCollections.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load curated photos ${convert.jsonDecode(response.body)}');
    }
  }


}
