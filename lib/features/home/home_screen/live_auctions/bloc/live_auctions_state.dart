part of 'live_auctions_bloc.dart';

@immutable
abstract class LiveAuctionsState extends Equatable {}

class LiveAuctionsLoadingState extends LiveAuctionsState {
  @override
  List<Object> get props => [];
}

class LiveAuctionsSuccessState extends LiveAuctionsState {
  final PopularVideos popularVideos;

  LiveAuctionsSuccessState(this.popularVideos);

  @override
  List<Object?> get props => [popularVideos];
}

class LiveAuctionsErrorState extends LiveAuctionsState {
  final String error;

  LiveAuctionsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
