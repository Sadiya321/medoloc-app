import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/appointment_book_screen.dart';
import 'package:medoloc/widgets/favorite_button.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  String? selectedSlot; // Add this at the top of your state class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            MedoLocRow(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350, // Set a fixed width
              height: 150,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
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
                            Text("name", style: medium18),
                            Text(
                              "specialization",
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColor.cardtext,
                                fontWeight: FontWeight.w200,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "10.00 AM - 4.00 PM",
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
                                    height: 33,
                                    width: 140,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AppointmentBookingScreen()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primary,
                                        shadowColor: Colors.black,
                                        elevation: 4,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 6),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      child: const Text(
                                        'Appointment',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                  height: 84,
                  width: 305,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(
                        10), // Set your desired radius here
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildContainer('100',
                            'Running'), // Different text for each container
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildContainer('500', 'Ongoing'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: buildContainer('700', 'Patient'),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Services",
                      style: medium18 // Adjust the text style as needed
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      buildText('1.',
                          'Advanced Cardiac Diagnostics and Health Assessments'),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      buildText('2.',
                          'Comprehensive Heart Disease Prevention, Management'),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      buildText('3.',
                          'Advanced Cardiac Diagnostics and Health Assessments'),
                      Divider(),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            buildSlotsContainer(
                                'Today, 19 Aug', '9 slots available',
                                isSelected: selectedSlot == 'Today, 19 Aug',
                                onTap: () => setState(
                                    () => selectedSlot = 'Today, 19 Aug')),
                            SizedBox(width: 10),
                            SizedBox(width: 10),
                            buildSlotsContainer(
                                'Today, 29 sep', '9 slots available',
                                isSelected: selectedSlot == 'Today, 29 sep',
                                onTap: () => setState(
                                    () => selectedSlot = 'Today, 29 sep')),
                            SizedBox(width: 10),
                            buildSlotsContainer(
                                'Today, 19 jan', '9 slots available',
                                isSelected: selectedSlot == 'Today, 19 jan',
                                onTap: () => setState(
                                    () => selectedSlot = 'Today, 19 jan')),
                            SizedBox(width: 20),
                            buildSlotsContainer(
                                'Today, 19 jun', '9 slots available',
                                isSelected: selectedSlot == 'Today, 19 jun',
                                onTap: () => setState(
                                    () => selectedSlot = 'Today, 19 jun')),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary, // Background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(6), // Border radius
                          ),
                          minimumSize: Size(306, 54), // Width and height
                        ),
                        onPressed: () {
                          // Add your onPressed action here
                        },
                        child: Text(
                          "Next availability on wed, 20 Aug",
                          style: mediumwhite18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "OR",
                      style: regular13,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(6), // Border radius
                          ),

                          minimumSize: Size(332, 54), // Width and height
                        ),
                        onPressed: () {
                          // Add your onPressed action here
                        },
                        child: Text(
                          "Contact Doctor",
                          style: mediumprymary18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Location",
                            style: medium18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      width: 335,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                     
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildText(String text, text1) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text,
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColor.primary) // Adjust the text style as needed
          ),
      SizedBox(
        width: 5,
      ),
      Expanded(
        child: Text(text1,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.cardtext) // Adjust the text style as needed
            ),
      ),
    ],
  );
}

Widget buildContainer(String text, text1) {
  return Container(
    height: 64,
    width: 90,
    decoration: BoxDecoration(
      color: AppColor.containercolor,
      borderRadius: BorderRadius.circular(10), // Set your desired radius here
    ),
    alignment: Alignment.center, // Center the text
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: medium18, // Adjust the text style as needed
        ),
        Text(
          text1,
          style: TextStyle(
              color: AppColor.cardtext,
              fontWeight: FontWeight.w100,
              fontSize: 14), // Adjust the text style as needed
        ),
      ],
    ),
  );
}

Widget buildSlotsContainer(
  String text,
  String text1, {
  bool isSelected = false,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 200), // Add smooth animation
      height: isSelected ? 54 : 54, // Increase height when selected
      width: isSelected ? 150 : 130,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : Colors.transparent,

        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color.fromARGB(
              79, 103, 114, 148), // Set the border color to black
          width: 1, // Set the border width (adjust as needed)
        ), // Set your desired radius here
      ),
      alignment: Alignment.center, // Center the text
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isSelected ? AppColor.white : AppColor.subtext,
              ) // Adjust the text style as needed
              ),
          Text(
            text1,
            style: TextStyle(
                color: isSelected ? AppColor.white : AppColor.cardtext,
                fontWeight: FontWeight.w100,
                fontSize: 10), // Adjust the text style as needed
          ),
        ],
      ),
    ),
  );
}
