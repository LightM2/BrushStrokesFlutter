part of 'hot_bids_bloc.dart';

@immutable
abstract class HotBidsState extends Equatable {}

class HotBidsLoadingState extends HotBidsState {
  @override
  List<Object> get props => [];
}

class HotBidsSuccessState extends HotBidsState {
  final CuratedPhotos curatedPhotos;

  HotBidsSuccessState(this.curatedPhotos);

  @override
  List<Object?> get props => [curatedPhotos];
}

class HotBidsErrorState extends HotBidsState {
  final String error;

  HotBidsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
