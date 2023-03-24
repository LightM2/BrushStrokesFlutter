import 'package:brush_strokes/features/home/auction_screen/auction_screen.dart';
import 'package:brush_strokes/features/home/home_screen/live_auctions/bloc/live_auctions_bloc.dart';
import 'package:brush_strokes/features/home/live_auctions_screen/live_auctions_screen.dart';
import 'package:brush_strokes/models/videos/video.dart';
import 'package:brush_strokes/repositories/popular_videos_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class LiveAuctionsWidget extends StatelessWidget {
  const LiveAuctionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LiveAuctionsBloc>(
            create: (BuildContext context) =>
                LiveAuctionsBloc(PopularVideosRepository())),
      ],
      child: _blocBody(),
    );
  }

  Widget _blocBody() {
    return BlocProvider(
      create: (context) => LiveAuctionsBloc(PopularVideosRepository())
        ..add(PopularVideosLoaded()),
      child: BlocBuilder<LiveAuctionsBloc, LiveAuctionsState>(
        builder: (context, state) {
          if (state is LiveAuctionsLoadingState) {
            return _liveAuctionsShimmer(
              Theme.of(context).textTheme,
              Theme.of(context).colorScheme,
              () {
                Navigator.pushNamed(context, LiveAuctionsScreen.routeName);
              },
            );
          }
          if (state is LiveAuctionsErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is LiveAuctionsSuccessState) {
            List<Video> popularVideos = state.popularVideos.videos;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: _liveAuctionsHeader(
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                    () {
                      Navigator.pushNamed(
                        context,
                        LiveAuctionsScreen.routeName,
                      );
                    },
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: popularVideos.length,
                    separatorBuilder: (context, _) => SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      return _liveAuctionsItem(
                        popularVideos[index],
                        Theme.of(context).textTheme,
                        Theme.of(context).colorScheme,
                        () {
                          Navigator.pushNamed(context, AuctionScreen.routeName);
                        },
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

  Widget _liveAuctionsItem(
    Video auction,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openAuction,
  ) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              child: Ink.image(
                image: NetworkImage(auction.image),
                // todo video preview
                height: 200,
                width: 300,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: openAuction,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: colorScheme.onBackground,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '19:12:24 left', // todo timer
                      style: textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _liveAuctionsHeader(
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openLiveAuctions,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'Live auctions 🔴',
          style: textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: openLiveAuctions,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _liveAuctionsShimmer(
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback openLiveAuctions,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: _liveAuctionsHeader(
            textTheme,
            colorScheme,
            openLiveAuctions,
          ),
        ),
        SizedBox(
          height: 200,
          child: Shimmer.fromColors(
            baseColor: colorScheme.surfaceVariant,
            highlightColor: colorScheme.onSurfaceVariant,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
