// ignore_for_file: inference_failure_on_function_invocation

import 'package:brush_strokes/features/home/home_screen/home_header.dart';
import 'package:brush_strokes/features/home/home_screen/hot_bids/bloc/hot_bids_bloc.dart';
import 'package:brush_strokes/features/home/hot_bids_screen/hot_bids_screen.dart';
import 'package:brush_strokes/features/home/painting_widget/ui/painting_widget.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HotBidsWidget extends StatelessWidget {
  const HotBidsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotBidsBloc(
        context.read<CuratedPhotosRepository>(),
      )..add(CuratedPhotosLoaded(10)),
      child: _blocBody(),
    );
  }

  Widget _blocBody() {
    return BlocBuilder<HotBidsBloc, HotBidsState>(
      builder: (context, state) {
        if (state is HotBidsLoadingState) {
          return _hotBidsShimmer(
            Theme.of(context).textTheme,
            Theme.of(context).colorScheme,
            () {
              Navigator.pushNamed(context, HotBidsScreen.routeName);
            },
          );
        }
        if (state is HotBidsErrorState) {
          return const Center(child: Text("Error"));
        }
        if (state is HotBidsSuccessState) {
          List<Photo> curatedPhotos = state.curatedPhotos.photos;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: HomeHeader(
                  'Hot bids 🔥',
                  () {
                    Navigator.pushNamed(
                      context,
                      HotBidsScreen.routeName,
                    );
                  },
                ),
              ),
              Container(
                height: 220,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: curatedPhotos.length,
                  separatorBuilder: (context, _) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return _hotBidsItem(
                      curatedPhotos[index],
                      Theme.of(context).textTheme,
                      Theme.of(context).colorScheme,
                      () => showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        //useRootNavigator: true,
                        context: context,
                        builder: (modal) {
                          return PaintingWidget(curatedPhotos[index].id);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _hotBidsItem(
    Photo photo,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openPhoto,
  ) {
    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hotBidPhoto(
            photo,
            textTheme,
            colorScheme,
            openPhoto,
          ),
          Spacer(flex: 8),
          Text(
            photo.photographer,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: textTheme.titleLarge,
          ),
          Spacer(flex: 4),
          Text(
            photo.alt,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _hotBidPhoto(
    Photo photo,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openPhoto,
  ) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              child: Ink.image(
                image: NetworkImage(photo.src.medium),
                height: 160,
                width: 160,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: openPhoto,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colorScheme.background.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  photo.avgColor,
                  style: textTheme.labelMedium?.copyWith(color: goldColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotBidsShimmer(
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openHotBids,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: HomeHeader('Hot bids 🔥', openHotBids),
        ),
        SizedBox(
          height: 220,
          child: Shimmer.fromColors(
            baseColor: colorScheme.surfaceVariant,
            highlightColor: colorScheme.onSurfaceVariant,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, _) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 150,
                        height: 20,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 100,
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
