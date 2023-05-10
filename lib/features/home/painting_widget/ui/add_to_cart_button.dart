import 'package:brush_strokes/models/photos/photo.dart';
import 'package:brush_strokes/theme/colors.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton(this.painting, this.enable, this.addToCart,
      {super.key});

  final Photo painting;
  final bool enable;
  final VoidCallback addToCart;

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool enable = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      enable = widget.enable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _addToCartWidget(
      widget.painting,
      Theme.of(context).textTheme,
      Theme.of(context).colorScheme,
      enable,
      () {
        widget.addToCart();
        setState(() {
          enable = !enable;
        });
      },
    );
  }

  Widget _addToCartWidget(
    Photo painting,
    TextTheme textTheme,
    ColorScheme colorScheme,
    bool enable,
    VoidCallback addToCart,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FilledButton(
            onPressed: enable ? addToCart : null,
            child: Text(
              enable ? 'Add to Cart' : 'In the Cart',
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
}
