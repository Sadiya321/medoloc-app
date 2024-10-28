import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'login.dart'; // Importing the login screen

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ntejas.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay for content
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Content of the screen
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centering horizontally
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Medo",
                          style: TextStyle(
                            fontSize: 66,
                            color: AppColor.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Loc",
                          style: TextStyle(
                            fontSize: 66,
                            color: AppColor.textsub,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "Find and Appoint a  Doctor  Easily",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.maintext,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the login screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "GET STARTED",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50), // Padding at the bottom
            ],
          ),
        ],
      ),
    );
  }
}
