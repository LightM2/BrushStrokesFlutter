// ignore_for_file: inference_failure_on_function_invocation

import 'dart:io';

import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/env/env.dart';
import 'package:brush_strokes/models/collections/collection_media.dart';
import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/models/videos/popular_videos.dart';
import 'package:brush_strokes/models/videos/video.dart';
import 'package:dio/dio.dart';

class PexelsApiClient {
  PexelsApiClient({Dio? dio})
      : _dio = dio ?? Dio()
          ..options.headers.addAll(
            {
              HttpHeaders.authorizationHeader: Env.pexelsApiKey,
            },
          );

  final Dio _dio;

  Future<CuratedPhotos> getCuratedPhotos(int perPage) async {
    String curatedPhotosEndpoint = '$BASE_URL/curated?per_page=$perPage';
    final dioResponse = await _dio.get(curatedPhotosEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return CuratedPhotos.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }

  Future<FeaturedCollections> getFeaturedCollections() async {
    const featuredCollectionsEndpoint =
        '$BASE_URL/collections/featured?per_page=10';
    final dioResponse = await _dio.get(featuredCollectionsEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return FeaturedCollections.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }

  Future<PopularVideos> getPopularVideos() async {
    const popularVideosEndpoint = '$VIDEO_BASE_URL/popular?per_page=5';
    final dioResponse = await _dio.get(popularVideosEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return PopularVideos.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }

  Future<Photo> getPhoto(int id) async {
    String photoEndpoint = '$BASE_URL/photos/$id';
    final dioResponse = await _dio.get(photoEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return Photo.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }

  Future<Video> getVideo(int id) async {
    String videoEndpoint = '$VIDEO_BASE_URL/videos/$id';
    final dioResponse = await _dio.get(videoEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return Video.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }

  Future<CollectionMedia> getCollectionMedia(int id) async {
    String collectionMediaEndpoint = '$BASE_URL/collections/$id?per_page=10';
    final dioResponse = await _dio.get(collectionMediaEndpoint);

    if (dioResponse.statusCode == 200) {
      Map<String, dynamic> json = dioResponse.data! as Map<String, dynamic>;
      return CollectionMedia.fromJson(json);
    } else {
      throw Exception(dioResponse.statusMessage);
    }
  }
}
