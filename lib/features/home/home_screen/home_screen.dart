import 'package:brush_strokes/features/home/home_screen/best_collections/ui/best_collections_widget.dart';
import 'package:brush_strokes/features/home/home_screen/hot_bids/ui/hot_bids_widget.dart';
import 'package:brush_strokes/features/home/home_screen/live_auctions/ui/live_auctions_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(top: mediaQueryData.viewPadding.top),
      alignment: Alignment.topLeft,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
        ],
      ),
    );
  }
}
