import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';

class ButtonContact extends StatelessWidget {
  final String imagePath;
  final String label;

  const ButtonContact({
    Key? key,
    required this.imagePath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0, // Custom elevation
      borderRadius: BorderRadius.circular(10.0), // Rounded edges
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Handle button tap
        },
        borderRadius: BorderRadius.circular(10.0),
        splashColor: Colors.teal.withOpacity(0.3), // Customize ripple effect
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imagePath,
                width: 15,
                height: 15,
              ),
              Text(
                label,
                style: medgreen12
              ),
            ],
          ),
        ),
      ),
    );
  }
}
