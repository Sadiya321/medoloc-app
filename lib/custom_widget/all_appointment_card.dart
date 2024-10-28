import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';

class AllAppointmentCard extends StatelessWidget {
  final String date;
  final String month;
  final String daysAgo;
  final String doctorName;
  final String prescriptionInfo;

  const AllAppointmentCard({
    Key? key,
    required this.date,
    required this.month,
    required this.daysAgo,
    required this.doctorName,
    required this.prescriptionInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 335,
      child: Card(
elevation: 4,
        margin: EdgeInsets.only(bottom: 6),        // padding: const EdgeInsets.all(16.0),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(12.0),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.2),
        //       spreadRadius: 2,
        //       blurRadius: 5,
        //       offset: const Offset(0, 3),
        //     ),
        //   ],
        // ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Date container
                  Container(
                    width: 55,
                    height: 60,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(date, style: medium14),
                        Text(month, style: medium14),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Days ago info below the teal container
                  Container(
                    width: 70,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(53, 14, 190, 128),
                    ),
                    child: Center(
                      child: Text(daysAgo, style: medium12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            // Appointment details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('You Had an Appointment Recently',
                        style: submedium14),
                  ),
                  const SizedBox(height: 8.0),
                  Text(doctorName, style: regular12),
                  const SizedBox(height: 6.0),
                  Text(
                    prescriptionInfo,
                    style: light12
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
