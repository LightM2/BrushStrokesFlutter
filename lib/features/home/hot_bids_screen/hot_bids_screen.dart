import 'package:brush_strokes/features/home/home_screen/hot_bids/bloc/hot_bids_bloc.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/curated_photos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotBidsScreen extends StatelessWidget {
  const HotBidsScreen({super.key});

  static const routeName = '/hot_bids';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotBidsBloc>(
            create: (BuildContext context) =>
                HotBidsBloc(CuratedPhotosRepository())),
      ],
      child: _blocBody(context),
    );
  }

  Widget _blocBody(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HotBidsBloc(CuratedPhotosRepository())..add(CuratedPhotosLoaded(40)),
      child: CustomScrollView(
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
              if (state is HotBidsLoadingState) {}
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
                      () {}, // todo open photo bottom sheets
                    );
                  },
                );
              }
              return SliverToBoxAdapter(child: Container());
            },
          ),
        ],
      ),
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
              SizedBox(height: 4),
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

}
