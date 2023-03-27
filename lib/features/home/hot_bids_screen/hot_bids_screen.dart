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
      child: _blocBody(),
    );
  }

  Widget _blocBody() {
    return BlocProvider(
      create: (context) =>
      HotBidsBloc(CuratedPhotosRepository())..add(CuratedPhotosLoaded(40)),
      child: BlocBuilder<HotBidsBloc, HotBidsState>(
        builder: (context, state) {
          if (state is HotBidsLoadingState) {

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

              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
