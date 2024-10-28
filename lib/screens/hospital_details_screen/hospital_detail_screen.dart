import 'package:flutter/material.dart';
import 'package:medoloc/screens/hospital_details_screen/Custom_Button_Grid.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/category_widget.dart';
import 'package:medoloc/widgets/favorite_button.dart';
import 'package:medoloc/sub_screens/home_screens_widget.dart';

class HospitalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Hospital Image with Favorite Button
            Stack(
              children: [
                Container(
                  height: 211,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  right: 16,
                  child: FavoriteButton(),
                ),
              ],
            ),

            // Hospital Details Section
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hospital Name
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manipal Hospital Bangalore',
                            style: semibold16,
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                
                    // Custom Button Grid
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: CustomButtonGrid(),
                            ),
                             SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CategoryWidget(),
                        ),
                        // Additional hospital information can be added here
                        SizedBox(height: 16),
                        homescreenWidget(),
                          ],
                        ),
                      ),
                    ),
                   
                
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage in main.dart or navigation:
/*
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HospitalDetailsScreen()),
);
*/