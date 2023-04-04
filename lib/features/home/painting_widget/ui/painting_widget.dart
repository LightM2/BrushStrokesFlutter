import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/features/home/painting_widget/bloc/painting_bloc.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/photo_repository.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaintingWidget extends StatelessWidget {
  final int id;

  const PaintingWidget(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaintingBloc(context.read<PhotoRepository>())
        ..add(PaintingLoaded(id)),
      child: _blocBody(),
    );
  }

  Widget _blocBody() {
    return BlocBuilder<PaintingBloc, PaintingState>(
      builder: (context, state) {
        if (state is PaintingLoadingState) {}
        if (state is PaintingErrorState) {
          return Center(child: Text("Error - ${state.error}"));
        }
        if (state is PaintingSuccessState) {
          Photo painting = state.painting;
          return _successPaintingWidget(context, painting);
        }

        return Container();
      },
    );
  }

  Widget _successPaintingWidget(BuildContext context, Photo painting) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: _paintingImage(
            painting,
            size.height * .4,
            size.width,
            () {},
            () {},
          ),
        ),
        Positioned(
          right: 0.0,
          top: size.height * .35,
          child: Container(
            alignment: Alignment(0, size.height * .5),
            height: size.height * .65,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Theme.of(context).colorScheme.background,
            ),
            child: CustomScrollView(
              slivers: [
                _paintingInformation(
                  painting,
                  Theme.of(context).textTheme,
                  Theme.of(context).colorScheme,
                ),
                SliverToBoxAdapter(
                  child: _addToCartWidget(
                    painting,
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                    () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _paintingInformation(
    Photo painting,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            Text(painting.avgColor, style: textTheme.headlineSmall),
            SizedBox(height: 4),
            Text(
              'Edition 1 of 10',
              style: textTheme.bodyMedium
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.network(
                    painting.src.portrait,
                    fit: BoxFit.cover,
                    height: 44,
                    width: 44,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artist',
                      style: textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    SizedBox(height: 4),
                    Text(painting.photographer, style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
              child: Text(
                'Overview',
                style:
                    textTheme.titleMedium?.copyWith(color: colorScheme.primary),
              ),
            ),
            Divider(thickness: 2, color: colorScheme.primary),
            Text(
              painting.alt.isEmpty ? BASE_OVERVIEW : painting.alt,
              style: textTheme.bodyLarge
                  ?.copyWith(color: colorScheme.onSurfaceVariant),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _addToCartWidget(
    Photo painting,
    TextTheme textTheme,
    ColorScheme colorScheme,
    VoidCallback addToCart,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: addToCart,
            child: Text(
              'Add to Cart',
              style: textTheme.titleMedium
                  ?.copyWith(color: colorScheme.onBackground),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 12),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: 'Price: ',
              style: textTheme.titleMedium,
              children: [
                TextSpan(
                  text: '${(painting.id / 3000).round()}\$',
                  style: textTheme.titleMedium?.copyWith(color: goldColor),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _paintingImage(
    Photo painting,
    double height,
    double width,
    VoidCallback closeWidget,
    VoidCallback showFullPainting,
  ) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Image.network(
            painting.src.large,
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: closeWidget,
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white.withOpacity(0.25),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size(16, 16),
                  ),
                ),
              ),
              IconButton(
                onPressed: showFullPainting,
                icon: const Icon(
                  Icons.open_in_full,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white.withOpacity(0.25),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size(16, 16),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
