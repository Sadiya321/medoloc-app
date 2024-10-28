import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';

class ReminderChipWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap; // Callback for interaction

  ReminderChipWidget(this.text,
      {super.key, this.isSelected = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the Container with GestureDetector
      onTap: onTap, // Call the onTap callback when tapped
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary: const Color.fromARGB(18, 18, 128, 88),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColor.white :AppColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}