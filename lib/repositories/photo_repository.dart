import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:http/http.dart' as http;

class PhotoRepository {
  Future<Photo> getPhoto(int id) async {
    String photoEndpoint = '$BASE_URL/photos/$id';
    final response = await http.get(
      Uri.parse(photoEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Photo.fromJson(jsonResponse);
    } else {
      throw Exception(
        'Failed to load photo ${convert.jsonDecode(response.body)}',
      );
    }
  }
}
