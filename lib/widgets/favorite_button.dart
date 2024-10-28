import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';

class FavoriteButton extends StatefulWidget {
  final double iconsSize;

  const FavoriteButton({
    this.iconsSize = 20.0,
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isLoading = false;
  bool isFav = false; // Track if the item is marked as favorite

  void _handleTap() async {
    setState(() {
      isLoading = true;
    });

    // Simulate a network or database action
    await Future.delayed(Duration(milliseconds: 300));

    setState(() {
      isFav = !isFav; // Toggle the favorite status
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            width: widget.iconsSize,
            height: widget.iconsSize,
            child: const CircularProgressIndicator(
              strokeWidth: 2.0,
              color: AppColor.primary,
            ),
          )
        : IconButton(
            iconSize: widget.iconsSize,
            padding: const EdgeInsets.all(0.0),
            splashRadius: 24.0,
            onPressed: _handleTap,
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: isFav ? AppColor.errorbar : AppColor.errorbar,
            ),
            tooltip: 'Favorite',
          );
  }
}
