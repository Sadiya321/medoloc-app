import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              MedoLocRow(),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 520, width: 330,
                // padding: const EdgeInsets.all(50.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset:
                          Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Back button
                    // Align(),
                    SizedBox(height: 30),
                    // Asset image in a circle
                    Image.asset(
                      'assets/images/thum.png', // Path to your asset image
                      fit: BoxFit.cover,
                      height: 156,
                      width: 156,
                    ),
                    SizedBox(height: 20),
                    // Thank you text
                    const Text(
                      'Thank You !',
                      style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                          color: AppColor.subtext),
                    ),
                    SizedBox(height: 10),
                    // Success message
                    Text(
                      'Your Appointment Successful',
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 91, 91, 91),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 25),
                    // Appointment details
                    Text(
                      'You booked an appointment with Dr.\n Jenny on February 21,\n at 02:00 PM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Done button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: SizedBox(height:43 ,width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            // Done button action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: whitetsemibold16
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
