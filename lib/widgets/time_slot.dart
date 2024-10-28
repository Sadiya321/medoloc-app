import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';

class TimeSlotWidget extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap; // Callback for interaction

  TimeSlotWidget(this.time, {this.isSelected = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the Container with GestureDetector
      onTap: onTap, // Call the onTap callback when tapped
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : const Color.fromARGB(18, 18, 128, 88),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColor.white : AppColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}