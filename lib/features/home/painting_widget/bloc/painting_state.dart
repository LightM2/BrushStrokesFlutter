part of 'painting_bloc.dart';

@immutable
abstract class PaintingState extends Equatable {}

class PaintingLoadingState extends PaintingState {
  @override
  List<Object> get props => [];
}

class PaintingSuccessState extends PaintingState {
  final Photo painting;

  PaintingSuccessState(this.painting);

  @override
  List<Object?> get props => [painting];
}

class PaintingErrorState extends PaintingState {
  final String error;

  PaintingErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
