import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/models/videos/video.dart';
import 'package:http/http.dart' as http;

class VideoRepository {
  Future<Video> getVideo(int id) async {
    String videoEndpoint = '$VIDEO_BASE_URL/videos/$id';
    final response = await http.get(
      Uri.parse(videoEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Video.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
