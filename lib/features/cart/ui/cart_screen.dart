import 'package:brush_strokes/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartSuccessState) {
        return Container(
          alignment: Alignment.center,
          child: Text('Cart list - ${state.paintings.map((e) => e.avgColor)}'),
        );
      }
      return Container();
    });
  }
}
