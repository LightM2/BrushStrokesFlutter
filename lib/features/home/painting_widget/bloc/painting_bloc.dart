import 'package:bloc/bloc.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/photo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'painting_event.dart';
part 'painting_state.dart';

class PaintingBloc extends Bloc<PaintingEvent, PaintingState> {
  final PhotoRepository _photoRepository;

  PaintingBloc(this._photoRepository) : super(PaintingLoadingState()) {
    on<PaintingLoaded>((event, emit) async {
      emit(PaintingLoadingState());

      try {
        final painting = await _photoRepository.getPhoto(event.id);
        emit(PaintingSuccessState(painting));
      } catch (e) {
        emit(PaintingErrorState(e.toString()));
      }
    });
  }
}
