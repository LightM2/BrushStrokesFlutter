part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessState extends CartState {
  final Set<Photo> paintings;

  CartSuccessState(this.paintings);

  @override
  List<Object?> get props => [paintings];

  Map<String, dynamic> toJson() {
    return {'paintings': paintings};
  }
}
