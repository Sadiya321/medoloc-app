import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';
import 'navigation_bar.dart'; // Import your BottomNavBarExample widget

class FavoriteDoctorsScreen extends StatefulWidget {
  @override
  _FavoriteDoctorsScreenState createState() => _FavoriteDoctorsScreenState();
}

class _FavoriteDoctorsScreenState extends State<FavoriteDoctorsScreen> {
  final List<Map<String, String>> _doctors = [
    {'name': 'Dr. Jenny', 'specialization': 'Specialist Cardiologist'},
    {'name': 'Dr. Ragavan', 'specialization': 'Specialist Dentist'},
    {'name': 'Dr. Priya', 'specialization': 'Neurologist'},
    {'name': 'Dr. Aryan', 'specialization': 'Pediatrician'},
    {'name': 'Dr. Simran', 'specialization': 'Pulmonologist'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
           MedoLocRow(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 12),
                  child: Text("Favorite Doctors", style: subtextsemibold16),
                ),
              ],
            ),             SizedBox(height: 15,),
            ..._doctors.map((doctor) {
              return DoctorAppointmentCard(
                name: doctor['name']!,
                specialization: doctor['specialization']!,
                timings: '10:00 AM - 4:00 PM', onPressed: () {  }, // Example timings
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
