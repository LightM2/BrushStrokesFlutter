import 'dart:convert' as convert;
import 'dart:ffi';
import 'dart:io';

import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/models/collections/collection_media.dart';
import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/models/videos/popular_videos.dart';
import 'package:brush_strokes/models/videos/video.dart';
import 'package:http/http.dart' as http;

class PexelsClient {
  static const baseURL = 'https://api.pexels.com/v1';
  static const videoBaseURL = 'https://api.pexels.com/videos';

  Future<CuratedPhotos> getCuratedPhotos() async {
    const curatedPhotosEndpoint = '$baseURL/curated?per_page=10';
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
          'Failed to load featured collections ${convert.jsonDecode(response.body)}');
    }
  }

  Future<PopularVideos> getPopularVideos() async {
    const popularVideosEndpoint = '$videoBaseURL/popular?per_page=3';
    final response = await http.get(
      Uri.parse(popularVideosEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return PopularVideos.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load popular videos ${convert.jsonDecode(response.body)}');
    }
  }

  Future<Photo> getPhoto(int id) async {
    String photoEndpoint = '$baseURL/photos/$id';
    final response = await http.get(
      Uri.parse(photoEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Photo.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load photo ${convert.jsonDecode(response.body)}');
    }
  }

  Future<Video> getVideo(int id) async {
    String videoEndpoint = '$videoBaseURL/videos/$id';
    final response = await http.get(
      Uri.parse(videoEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return Video.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load video ${convert.jsonDecode(response.body)}');
    }
  }

  Future<CollectionMedia> getCollectionMedia(int id) async {
    String collectionMediaEndpoint = '$baseURL/collections/$id?per_page=10';
    final response = await http.get(
      Uri.parse(collectionMediaEndpoint),
      headers: {
        HttpHeaders.authorizationHeader: Env.pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

      return CollectionMedia.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load collection media ${convert.jsonDecode(response.body)}');
    }
  }

}
