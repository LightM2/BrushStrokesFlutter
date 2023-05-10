part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessState extends CartState {
  final List<Photo> paintings;

  CartSuccessState(this.paintings);

  @override
  List<Object?> get props => [paintings];

  Map<String, dynamic> toJson() {
    return {'paintings': paintings};
  }
}

class CartErrorState extends CartState {
  final String error;

  CartErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
