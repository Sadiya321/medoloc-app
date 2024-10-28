import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';

class DoctorButton extends StatelessWidget {
  final String name;
  final String specialization;

  DoctorButton({
    required this.name,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 210,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius:
            BorderRadius.circular(12), // Adjust the radius value as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Rectangle 506.png',
              width: 125, // Adjust width as needed
              height: 125,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: medium18,
            ),
            Text(
              specialization,
              style: TextStyle(
                fontSize: 12,
                color: AppColor.cardtext,
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
