import 'package:brush_strokes/features/home/auction_screen/auction_screen.dart';
import 'package:brush_strokes/features/home/best_collections_screen/best_collections_screen.dart';
import 'package:brush_strokes/features/home/collection_screen/collection_screen.dart';
import 'package:brush_strokes/features/home/home_screen/home_screen.dart';
import 'package:brush_strokes/features/home/hot_bids_screen/hot_bids_screen.dart';
import 'package:brush_strokes/features/home/live_auctions_screen/live_auctions_screen.dart';
import 'package:brush_strokes/features/root/ui/navigator_keys.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorKeys.bottomNavigationBarHomeItem,
      initialRoute: HomeScreen.routeName,
      onPopPage: (route, setting) => route.didPop(setting),
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case HomeScreen.routeName:
            builder = (BuildContext _) => const HomeScreen();
            break;
          case AuctionScreen.routeName:
            builder = (BuildContext _) => const AuctionScreen();
            break;
          case BestCollectionsScreen.routeName:
            builder = (BuildContext _) => const BestCollectionsScreen();
            break;
          case CollectionScreen.routeName:
            builder = (BuildContext _) => const CollectionScreen();
            break;
          case HotBidsScreen.routeName:
            builder = (BuildContext _) => const HotBidsScreen();
            break;
          case LiveAuctionsScreen.routeName:
            builder = (BuildContext _) => const LiveAuctionsScreen();
            break;
          default:
            builder = (BuildContext _) => const HomeScreen();
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
