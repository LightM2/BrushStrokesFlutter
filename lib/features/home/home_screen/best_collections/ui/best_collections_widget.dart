import 'package:brush_strokes/features/home/best_collections_screen/best_collections_screen.dart';
import 'package:brush_strokes/features/home/collection_screen/collection_screen.dart';
import 'package:brush_strokes/features/home/home_screen/best_collections/bloc/best_collections_bloc.dart';
import 'package:brush_strokes/features/home/home_screen/home_header.dart';
import 'package:brush_strokes/models/collections/collection.dart';
import 'package:brush_strokes/repositories/featured_collections_repository.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BestCollectionWidget extends StatelessWidget {
  const BestCollectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BestCollectionsBloc>(
          create: (BuildContext context) =>
              BestCollectionsBloc(FeaturedCollectionsRepository()),
        ),
      ],
      child: _blocBody(),
    );
  }

  Widget _blocBody() {
    return BlocProvider(
      create: (context) => BestCollectionsBloc(FeaturedCollectionsRepository())
        ..add(FeaturedCollectionsLoaded()),
      child: BlocBuilder<BestCollectionsBloc, BestCollectionsState>(
          builder: (context, state) {
        if (state is BestCollectionsLoadingState) {
          return _bestCollectionsShimmer(
            Theme.of(context).textTheme,
            Theme.of(context).colorScheme,
            () {
              Navigator.pushNamed(context, BestCollectionsScreen.routeName);
            },
          );
        }
        if (state is BestCollectionsErrorState) {
          return const Center(child: Text("Error"));
        }
        if (state is BestCollectionsSuccessState) {
          List<Collection> featuredCollections =
              state.featuredCollections.collections;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: HomeHeader(
                  'Best collections 💥',
                  () {
                    Navigator.pushNamed(
                      context,
                      BestCollectionsScreen.routeName,
                    );
                  },
                ),
              ),
              Container(
                height: 140,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredCollections.length,
                  separatorBuilder: (context, _) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return _bestCollectionsItem(
                      featuredCollections[index],
                      Theme.of(context).textTheme,
                      Theme.of(context).colorScheme,
                      () {
                        Navigator.pushNamed(
                            context, CollectionScreen.routeName);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        }

        return Container();
      }),
    );
  }

  Widget _bestCollectionsItem(
    Collection collection,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openCollection,
  ) {
    return Material(
      child: InkWell(
        onTap: openCollection,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 140,
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  collection.title.characters.first,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall,
                ),
              ),
              SizedBox(height: 8),
              Text(
                collection.title,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                '${collection.mediaCount} ETH',
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(color: goldColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bestCollectionsShimmer(
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openBestCollections,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: HomeHeader('Best collections 💥', openBestCollections),
        ),
        SizedBox(
          height: 140,
          child: Shimmer.fromColors(
            baseColor: colorScheme.surfaceVariant,
            highlightColor: colorScheme.onSurfaceVariant,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, _) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: 90,
                        height: 20,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 50,
                        height: 12,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
