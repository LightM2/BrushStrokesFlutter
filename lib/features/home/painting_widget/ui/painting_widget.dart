// ignore_for_file: inference_failure_on_instance_creation

import 'package:brush_strokes/const.dart';
import 'package:brush_strokes/features/cart/bloc/cart_bloc.dart';
import 'package:brush_strokes/features/home/painting_widget/bloc/painting_bloc.dart';
import 'package:brush_strokes/features/home/painting_widget/ui/add_to_cart_button.dart';
import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/repositories/photo_repository.dart';
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
        if (state is PaintingLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
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
            () {
              Navigator.pop(context);
            },
            () {
              _paintingDialog(context, painting.src.large);
            },
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
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: _paintingInformation(
                    painting,
                    Theme.of(context).textTheme,
                    Theme.of(context).colorScheme,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AddToCartButton(
                    painting,
                    context.read<CartBloc>().contains(painting.id),
                    () {
                      context.read<CartBloc>().add(AddPainting(painting));
                    },
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
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        Text(painting.avgColor, style: textTheme.headlineSmall),
        SizedBox(height: 4),
        Text(
          'Edition 1 of 10',
          style: textTheme.bodyMedium
              ?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
        SizedBox(height: 24),
        _paintingArtist(
          painting.src.small,
          painting.photographer,
          textTheme,
          colorScheme,
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
          child: Text(
            'Overview',
            style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
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
    );
  }

  Widget _paintingArtist(
    String url,
    String name,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.network(
            url,
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
            Text(name, style: textTheme.titleMedium),
          ],
        ),
      ],
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
              _paintingIconButton(Icons.arrow_downward, closeWidget),
              _paintingIconButton(Icons.open_in_full_rounded, showFullPainting),
            ],
          ),
        )
      ],
    );
  }

  Widget _paintingIconButton(
    IconData buttonIcon,
    VoidCallback onClick,
  ) {
    return IconButton(
      onPressed: onClick,
      icon: Icon(
        buttonIcon,
        color: Colors.white,
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.grey.withOpacity(0.45),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(16, 16),
        ),
      ),
    );
  }

  void _paintingDialog(
    BuildContext context,
    String url,
  ) {
    showGeneralDialog(
      useRootNavigator: false,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  url,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                right: 16,
                top: 32,
                child: _paintingIconButton(
                  Icons.close_fullscreen_rounded,
                  () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
