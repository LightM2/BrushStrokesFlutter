part of 'hot_bids_bloc.dart';

@immutable
abstract class HotBidsEvent extends Equatable {
  const HotBidsEvent();
}

class CuratedPhotosLoaded extends HotBidsEvent {
  @override
  List<Object?> get props => [];
}
