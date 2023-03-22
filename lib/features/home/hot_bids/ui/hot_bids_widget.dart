import 'package:brush_strokes/features/home/hot_bids/bloc/hot_bids_bloc.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotBidsWidget extends StatelessWidget {
  const HotBidsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotBidsBloc>(
            create: (BuildContext context) =>
                HotBidsBloc(CuratedPhotosRepository())),
      ],
      child: blocBody(),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) =>
          HotBidsBloc(CuratedPhotosRepository())..add(CuratedPhotosLoaded()),
      child: BlocBuilder<HotBidsBloc, HotBidsState>(
        builder: (context, state) {
          if (state is HotBidsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
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
                  child: hotBidsHeader(
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                    () {},
                  ),
                ),
                Container(
                  height: 260,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: curatedPhotos.length,
                    separatorBuilder: (context, _) => SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return hotBidsItem(
                        curatedPhotos[index],
                        Theme.of(context).textTheme,
                        Theme.of(context).colorScheme,
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget hotBidsItem(
    Photo photo,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: < Widget> [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(100),
                    child: Image.network(photo.src.medium, fit: BoxFit.cover),
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
                        style: textTheme.labelMedium
                            ?.copyWith(color: goldColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 8),
          Text(
            photo.photographer,
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

  Widget hotBidsHeader(
      TextTheme textTheme, ColorScheme colorScheme, VoidCallback openHotBids) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Hot bids 🔥',
          style: textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: openHotBids,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
