import 'package:flutter/material.dart';

class HotBidsScreen extends StatelessWidget {
  const HotBidsScreen({super.key});

  static const routeName = '/hot_bids';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Hot Bids'),
    );
  }
}
