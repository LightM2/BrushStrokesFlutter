part of 'best_collections_bloc.dart';

@immutable
abstract class BestCollectionsEvent extends Equatable {
  const BestCollectionsEvent();
}

class FeaturedCollectionsLoaded extends BestCollectionsEvent {
  @override
  List<Object?> get props => [];
}
