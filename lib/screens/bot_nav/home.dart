import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/category_button.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/category_widget.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';
import 'package:medoloc/sub_screens/home_screens_widget.dart';
import 'package:medoloc/widgets/near_by_hospitals.dart';
import 'package:medoloc/widgets/popular_doctor.dart';
import 'package:medoloc/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // Scrollable body for mobile
        child: Stack(
          children: [
            // Background for 30% of the screen height
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 211,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Rectangle 502.png'), // Your uploaded background image
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
              ),
            ),

            // Body content overlaid on top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ), // Spacer for title

                  // Title: MedoLoc (centered and larger)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Mask group.png',
                          width: 46, // Adjust width as needed
                          height: 43,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, // Centering horizontally
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Medo",
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Loc",
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColor.textsub,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),

                  // Search Bar
                  SearchBarScreen(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryWidget(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 215.0),
                    child: Text('Nearby Hospital', style: semibold16),
                  ),
                  const SizedBox(height: 10),

                  // Hospital Buttons (instead of cards)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HospitalButton(name: 'Manipal Hospital Bangalore'),
                        const SizedBox(
                          width: 20,
                        ),
                        HospitalButton(name: 'Apollo Hospital Chennai'),
                        const SizedBox(
                          width: 20,
                        ),
                        HospitalButton(name: 'Fortis Hospital Delhi'),
                      ],
                    ),
                  ),

                  // Medical Branches (Categories) Section using Buttons
                  homescreenWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// DoctorAppointmentCard widget to show doctors for appointment
