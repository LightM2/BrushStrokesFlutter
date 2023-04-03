import 'package:bloc/bloc.dart';
import 'package:brush_strokes/models/collections/featured_collections.dart';
import 'package:brush_strokes/repositories/featured_collections_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'best_collections_event.dart';

part 'best_collections_state.dart';

class BestCollectionsBloc
    extends Bloc<BestCollectionsEvent, BestCollectionsState> {
  final FeaturedCollectionsRepository _featuredCollectionsRepository;

  BestCollectionsBloc(this._featuredCollectionsRepository)
      : super(BestCollectionsLoadingState()) {
    on<FeaturedCollectionsLoaded>((event, emit) async {
      emit(BestCollectionsLoadingState());

      try {
        final featuredCollections =
            await _featuredCollectionsRepository.getFeaturedCollections();
        emit(BestCollectionsSuccessState(featuredCollections));
      } catch (e) {
        emit(BestCollectionsErrorState(e.toString()));
      }
    });
  }
}
