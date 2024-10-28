import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/contact_buttons.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';

class DoctorInfoCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String lastSeen;
  final String imageUrl; // New parameter for the image

  const DoctorInfoCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.lastSeen,
    required this.imageUrl, // Initialize imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 335,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Doctor Avatar with image inside a square with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                child: Image.asset(
                  imageUrl,
                  width: 82, // Width of the square
                  height: 82, // Height of the square
                  fit: BoxFit.cover, // Ensure the image covers the square
                ),
              ),
              const SizedBox(width: 12),
              // Doctor Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: medium18),
                    const SizedBox(height: 4),
                    Text(specialty, style: light12),
                    const SizedBox(height: 4),
                    Container(
                      width: 75,
                      height: 17,
                      color: const Color.fromARGB(53, 14, 190, 128),
                      child: Center(
                        child: Text(
                          lastSeen,
                          style: const TextStyle(
                              fontSize: 9.41,
                              fontWeight: FontWeight.w500,
                              color: AppColor.cardtext),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Date Container
              Container(
                width: 43.13,height: 47.05,
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(4.7),
                ),
                child: const Text(
                  '10\nAug',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 10.98,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // Action Buttons
          Row(
            children: [
              // Add space to the left of the Call button
              Container(
                margin:
                    const EdgeInsets.only(left: 90), // Add space on the left
                width: 83,height: 35.82, // Make the call button smaller in width
                child: const ButtonContact(
                  imagePath:
                      'assets/images/material-symbols-light_call.png', // Replace with your asset path
                  label: 'Call',
                ),
              ),
              
           
              const SizedBox(width: 4.5),
              Container(
                width: 125.5,height: 31.82,
                child: const ButtonContact(
                  imagePath:
                      'assets/images/ic_baseline-whatsapp.png', // Replace with your asset path
                  label: 'WhatsApp',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
