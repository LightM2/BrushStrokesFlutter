import 'package:brush_strokes/features/home/best_collections/ui/best_collections_widget.dart';
import 'package:brush_strokes/features/home/hot_bids/ui/hot_bids_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(top: mediaQueryData.viewPadding.top),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}
