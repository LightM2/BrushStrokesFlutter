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
      child: const HotBidsWidget(),
    );
  }
}
