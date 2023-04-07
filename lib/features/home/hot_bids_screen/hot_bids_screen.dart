// ignore_for_file: inference_failure_on_function_invocation

import 'package:brush_strokes/features/home/home_screen/hot_bids/bloc/hot_bids_bloc.dart';
import 'package:brush_strokes/features/home/painting_widget/ui/painting_widget.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HotBidsScreen extends StatelessWidget {
  const HotBidsScreen({super.key});

  static const routeName = '/hot_bids';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotBidsBloc(
        context.read<CuratedPhotosRepository>(),
      )..add(CuratedPhotosLoaded(40)),
      child: _blocBody(context),
    );
  }

  Widget _blocBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "Hot bids 🔥",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        BlocBuilder<HotBidsBloc, HotBidsState>(
          builder: (context, state) {
            if (state is HotBidsLoadingState) {
              return _hotBidsShimmer(Theme.of(context).colorScheme);
            }
            if (state is HotBidsErrorState) {
              return SliverToBoxAdapter(child: Center(child: Text("Error")));
            }
            if (state is HotBidsSuccessState) {
              List<Photo> curatedPhotos = state.curatedPhotos.photos;

              return SliverGrid.builder(
                itemCount: curatedPhotos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return _hotBidsItem(
                    curatedPhotos[index],
                    Theme.of(context).textTheme,
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
              );
            }
            return SliverToBoxAdapter(child: Container());
          },
        ),
      ],
    );
  }

  Widget _hotBidsItem(
    Photo photo,
    TextTheme textTheme,
    VoidCallback openPhoto,
  ) {
    return Material(
      child: InkWell(
        onTap: openPhoto,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  photo.src.portrait,
                  fit: BoxFit.cover,
                  height: 176,
                  width: 176,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 170,
                child: Text(
                  photo.photographer,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hotBidsShimmer(
    ColorScheme colorScheme,
  ) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: colorScheme.surfaceVariant,
          highlightColor: colorScheme.onSurfaceVariant,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 176,
                width: 176,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
