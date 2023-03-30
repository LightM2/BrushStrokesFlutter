import 'package:bloc/bloc.dart';
import 'package:brush_strokes/models/photos/curated_photos.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'hot_bids_event.dart';

part 'hot_bids_state.dart';

class HotBidsBloc extends Bloc<HotBidsEvent, HotBidsState> {
  final CuratedPhotosRepository _curatedPhotosRepository;

  HotBidsBloc(this._curatedPhotosRepository) : super(HotBidsLoadingState()) {
    on<CuratedPhotosLoaded>((event, emit) async {
      emit(HotBidsLoadingState());

      try {
        final curatedPhotos =
            await _curatedPhotosRepository.getCuratedPhotos(10);
        emit(HotBidsSuccessState(curatedPhotos));
      } catch (e) {
        emit(HotBidsErrorState(e.toString()));
      }
    });
  }
}
