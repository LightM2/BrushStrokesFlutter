import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String header;
  final VoidCallback openCollections;

  const HomeHeader(this.header, this.openCollections, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          header,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        IconButton(
          onPressed: openCollections,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
