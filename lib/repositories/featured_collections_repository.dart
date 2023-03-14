import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/base/const.dart';
import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:http/http.dart' as http;

class FeaturedCollectionsRepository {
  Future<FeaturedCollections> getFeaturedCollections() async {
    const featuredCollectionsEndpoint =
        '$BASE_URL/collections/featured?per_page=5';
    final response = await http.get(
      Uri.parse(featuredCollectionsEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return FeaturedCollections.fromJson(jsonResponse);
    } else {
      throw Exception(
        'Failed to load featured collections ${convert.jsonDecode(response.body)}',
      );
    }
  }
}
