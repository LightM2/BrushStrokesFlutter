part of 'painting_bloc.dart';

@immutable
abstract class PaintingEvent extends Equatable {
  const PaintingEvent();
}

class PaintingLoaded extends PaintingEvent {
  final int id;

  PaintingLoaded(this.id);

  @override
  List<Object?> get props => [id];
}
