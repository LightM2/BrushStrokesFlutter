import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';
import 'package:http/http.dart' as http;

class CuratedPhotosRepository {
  Future<CuratedPhotos> getCuratedPhotos() async {
    const curatedPhotosEndpoint = '$BASE_URL/curated?per_page=10';
    final response = await http.get(
      Uri.parse(curatedPhotosEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return CuratedPhotos.fromJson(jsonResponse);
    } else {
      throw Exception(
        'Failed to load curated photos ${convert.jsonDecode(response.body)}',
      );
    }
  }
}
