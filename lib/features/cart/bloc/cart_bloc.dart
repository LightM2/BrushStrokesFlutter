import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartSuccessState(cartRepository.photos)) {
    on<AddPainting>((event, emit) async {
      emit(CartLoadingState());
      final updatedPaintingList = cartRepository.addPainting(event.painting);
      emit(CartSuccessState(updatedPaintingList));
    });
    on<RemovePainting>((event, emit) {
      emit(CartLoadingState());
      final updatedPaintingList = cartRepository.removePainting(event.id);
      emit(CartSuccessState(updatedPaintingList));
    });
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final listOfPainting = (json['paintings'] as List)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toSet();

      cartRepository.photos = listOfPainting;
      return CartSuccessState(listOfPainting);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    if (state is CartSuccessState) {
      return state.toJson();
    } else {
      return null;
    }
  }

}
