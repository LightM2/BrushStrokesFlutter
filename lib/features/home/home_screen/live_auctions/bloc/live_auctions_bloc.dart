import 'package:bloc/bloc.dart';
import 'package:brush_strokes/models/videos/popular_videos.dart';
import 'package:brush_strokes/repositories/popular_videos_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'live_auctions_event.dart';

part 'live_auctions_state.dart';

class LiveAuctionsBloc extends Bloc<LiveAuctionsEvent, LiveAuctionsState> {
  final PopularVideosRepository _popularVideosRepository;

  LiveAuctionsBloc(this._popularVideosRepository)
      : super(LiveAuctionsLoadingState()) {
    on<PopularVideosLoaded>((event, emit) async {
      emit(LiveAuctionsLoadingState());

      try {
        final popularVideos = await _popularVideosRepository.getPopularVideos();
        emit(LiveAuctionsSuccessState(popularVideos));
      } catch (e) {
        emit(LiveAuctionsErrorState(e.toString()));
      }
    });
  }
}
