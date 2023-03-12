import 'dart:convert' as convert;

import 'package:brush_strokes/models/curated_photos.dart';
import 'package:http/http.dart' as http;

class PhotosClient {
  static const baseURL = 'https://api.pexels.com/v1';
  static const curatedPhotosEndpoint = '$baseURL/curated?per_page=5';

  Future<CuratedPhotos> getCuratedPhotos() async {
    final url = Uri.parse(curatedPhotosEndpoint);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // ignore: lines_longer_than_80_chars
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return CuratedPhotos.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load curated photos');
    }
  }

}
