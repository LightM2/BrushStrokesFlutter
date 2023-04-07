part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddPainting extends CartEvent {
  final Photo painting;

  const AddPainting(this.painting);

  @override
  List<Object> get props => [painting];
}

class RemovePainting extends CartEvent {
  final String id;

  const RemovePainting(this.id);

  @override
  List<Object> get props => [id];
}
