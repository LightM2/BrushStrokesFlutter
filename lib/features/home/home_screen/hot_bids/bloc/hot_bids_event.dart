part of 'hot_bids_bloc.dart';

@immutable
abstract class HotBidsEvent extends Equatable {
  const HotBidsEvent();
}

class CuratedPhotosLoaded extends HotBidsEvent {
  final int perPage;

  CuratedPhotosLoaded(this.perPage);

  @override
  List<Object?> get props => [perPage];
}
