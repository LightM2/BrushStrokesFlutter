part of 'live_auctions_bloc.dart';

@immutable
abstract class LiveAuctionsEvent extends Equatable {
  const LiveAuctionsEvent();
}

class PopularVideosLoaded extends LiveAuctionsEvent {
  @override
  List<Object?> get props => [];
}
