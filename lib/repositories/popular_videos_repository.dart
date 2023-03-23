import 'dart:convert' as convert;
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/models/videos/popular_videos.dart';
import 'package:http/http.dart' as http;

class PopularVideosRepository {
  Future<PopularVideos> getPopularVideos() async {
    const popularVideosEndpoint = '$VIDEO_BASE_URL/popular?per_page=5';
    final response = await http.get(
      Uri.parse(popularVideosEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      return PopularVideos.fromJson(jsonResponse);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
