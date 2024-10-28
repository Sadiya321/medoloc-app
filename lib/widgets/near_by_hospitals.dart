import 'package:flutter/material.dart';
import 'package:medoloc/screens/hospital_details_screen/hospital_detail_screen.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/favorite_button.dart';

class HospitalButton extends StatelessWidget {
  final String name;

  HospitalButton({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 287,
      width: 330,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HospitalDetailsScreen()),
);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Stack(
              children: [
                Image.asset(
                  'assets/images/image.png',
                  width: 300, // Adjust width as needed
                  height: 200,
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: FavoriteButton(
                    // productId: name,
                    // isFav: isFav,
                    // onTap: onFavoriteTap,
                    iconsSize: 24.0, // Adjust size if needed
                  ),
                ),
              ],
            ),
            // Placeholder for hospital image
            const SizedBox(height: 6),
           Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Expanded(
      child: Text(
        name,
        style: semibold16,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ),
  ],
),

          ],
        ),
      ),
    );
  }
}
