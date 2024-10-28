import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          MedoLocRow(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Instant Lifeline: The\nMedical SOS Solution',
                              style: semibold14),
                          SizedBox(height: 15),
                          Text(
                              'An emergency alert system that instantly connects you to help, sharing real-time location and vital health info to ensure fast, lifesaving response when it matters most.',
                              style: subtextmedium),
                        ],
                      ),
                    ),
                    // Right side - Image
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/images/sos.png',
                        height: 173,
                        width: 154,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // SOS Button
                GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Group 11020.png', // You'll need to add this image to your assets
                          height: 173, width: 154,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Service Buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildServiceButton(
                      imagePath: 'assets/images/Group 11028.png',
                      label: 'Ambulance',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildServiceButton(
                      imagePath: 'assets/images/Group 11023.png',
                      label: 'Police',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    _buildServiceButton(
                      imagePath: 'assets/images/Group 11024.png',
                      label: 'Fire Brigade',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

Widget _buildServiceButton({
  required String imagePath,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50, // Increased height to match design
      width: 215, // Full width to match design
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 4), // Added margin for spacing between buttons
      decoration: BoxDecoration(
        color: AppColor.primary, // Green color from design
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:12.0),
        child: Row(
          children: [
            const SizedBox(width: 16), // Left padding
            SizedBox(
              width: 24, // Fixed width for icon container
              height: 24,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12), // Space between icon and text
                           Text(label, style: semibold18),
        
          
          ],
        ),
      ),
    ),
  );
}
}
