import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/category_button.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';
import 'package:medoloc/widgets/near_by_hospitals.dart';
import 'package:medoloc/widgets/popular_doctor.dart';

class homescreenWidget extends StatefulWidget {
  @override
  State<homescreenWidget> createState() => _homescreenWidgetState();
}

class _homescreenWidgetState extends State<homescreenWidget> {
  final List<Map<String, String>> _doctors = [
    {'name': 'Dr. Jenny', 'specialization': 'Specialist Cardiologist'},
    {'name': 'Dr. Ragavan', 'specialization': 'Specialist Dentist'},
    {'name': 'Dr. Priya', 'specialization': 'Neurologist'},
    {'name': 'Dr. Aryan', 'specialization': 'Pediatrician'},
    {'name': 'Dr. Simran', 'specialization': 'Pulmonologist'},
  ];
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Popular Doctor Section
        Padding(
          padding: EdgeInsets.only(right: 215.0),
          child: Text('Popular Doctor', style: semibold16),
        ),
        // Text("All Categories", style: bold16),
        SizedBox(height: 20),

        // Filtered Doctor List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _doctors
                .where((doctor) =>
                    doctor['name']!.toLowerCase().contains(_searchText))
                .map((doctor) {
              return DoctorButton(
                name: doctor['name']!,
                specialization: doctor['specialization']!,
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Find and Appoint a Doctor Easily",
                  style: semibold16,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
        // Find and Appoint a Doctor Section
        SizedBox(height: 20),

        // Doctor Appointment Cards (instead of buttons)
        ..._doctors.map((doctor) {
          return DoctorAppointmentCard(
            name: doctor['name']!,
            specialization: doctor['specialization']!,
            timings: '10:00 AM - 4:00 PM',
            onPressed: () {}, // Example timings
          );
        }).toList(),

        SizedBox(width: 46), // To balance the back button width
      ],
    );
  }
}
