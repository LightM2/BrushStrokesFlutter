import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/models/collections/collection_media.dart';
import 'package:http/http.dart' as http;

class CollectionMediaRepository {
  Future<CollectionMedia> getCollectionMedia(int id) async {
    String collectionMediaEndpoint = '$BASE_URL/collections/$id?per_page=10';
    final response = await http.get(
      Uri.parse(collectionMediaEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return CollectionMedia.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
