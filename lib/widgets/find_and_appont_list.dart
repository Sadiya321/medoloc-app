import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/favorite_button.dart';

class DoctorAppointmentCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String timings;
  final VoidCallback onPressed; // Add an onPressed callback

  DoctorAppointmentCard({
    required this.name,
    required this.specialization,
    required this.timings,
    required this.onPressed, // Require onPressed in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Use GestureDetector for the card tap
      onTap: onPressed, // Trigger onPressed when tapped
      child: SizedBox(
        width: 350, // Set a fixed width
        height: 150,
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                // Doctor Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Group 581.png',
                    width: 82,
                    height: 82,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),

                // Doctor Information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: medium18),
                      Text(
                        specialization,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColor.cardtext,
                          fontWeight: FontWeight.w200,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        '$timings',
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColor.cardtext,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 30,
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Appointment',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 30,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.black,
                                  elevation: 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'View Profile',
                                  style: TextStyle(
                                    color: AppColor.subtext,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Favorite Icon
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteButton(),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Example usage with buttons below the card
class DoctorCardWithButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DoctorAppointmentCard(
          name: 'Dr. Jenny',
          specialization: 'Specialist Cardiologist',
          timings: '10:00 AM - 4:00 PM',
          onPressed: () {
            // Handle card tap here
            print('Card tapped!'); // You can replace this with your navigation logic or any other action
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Appointment'),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.white,
                    foregroundColor: Colors.black87,
                    elevation: 20,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('View Profile'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
