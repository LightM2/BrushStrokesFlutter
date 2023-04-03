import 'package:flutter/material.dart';

class LiveAuctionsScreen extends StatelessWidget {
  const LiveAuctionsScreen({super.key});

  static const routeName = '/live_auctions';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Live Auctions'),
    );
  }
}
