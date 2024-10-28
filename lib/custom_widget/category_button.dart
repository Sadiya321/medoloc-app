// Medical Branches (Categories) as buttons with custom icons
import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';

class CategoryButton extends StatelessWidget {
  final String iconPath;
  final String label;

  const CategoryButton({required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65, // Standardized width
      height: 65, // Standardized height
      margin: const EdgeInsets.only(right: 16),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Handle category button press
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 22.3,
              height: 29.6,
              color: AppColor.white,
            ), // Custom icon

            Text(
              label,
              style: const TextStyle(
                  fontSize: 12,
                  color: AppColor.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}