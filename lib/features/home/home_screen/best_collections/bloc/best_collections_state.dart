part of 'best_collections_bloc.dart';

@immutable
abstract class BestCollectionsState extends Equatable {}

class BestCollectionsLoadingState extends BestCollectionsState {
  @override
  List<Object> get props => [];
}

class BestCollectionsSuccessState extends BestCollectionsState {
  final FeaturedCollections featuredCollections;

  BestCollectionsSuccessState(this.featuredCollections);

  @override
  List<Object?> get props => [featuredCollections];
}

class BestCollectionsErrorState extends BestCollectionsState {
  final String error;

  BestCollectionsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
