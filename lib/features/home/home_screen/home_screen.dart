import 'package:brush_strokes/features/home/home_screen/best_collections/ui/best_collections_widget.dart';
import 'package:brush_strokes/features/home/home_screen/hot_bids/ui/hot_bids_widget.dart';
import 'package:brush_strokes/features/home/home_screen/live_auctions/ui/live_auctions_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: false,
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 16, bottom: 16),
            centerTitle: false,
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              HotBidsWidget(),
              SizedBox(height: 16),
              BestCollectionWidget(),
              SizedBox(height: 16),
              LiveAuctionsWidget(),
              SizedBox(height: 16),
            ],
          ),
          /*scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                'Home',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            HotBidsWidget(),
            SizedBox(height: 16),
            BestCollectionWidget(),
            SizedBox(height: 16),
            LiveAuctionsWidget(),
            SizedBox(height: 16),
          ],*/
        ),
      ],
    );
  }
}
