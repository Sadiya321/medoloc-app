import 'package:flutter/material.dart';
import 'package:medoloc/screens/bot_nav/home.dart';
import 'package:medoloc/screens/bot_nav/navigation_bar.dart';
import 'package:medoloc/strings/app_color.dart';
import 'signup.dart'; // Importing the signup screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final FocusNode _focusNode = FocusNode();
  String otp = "";

  final TextEditingController phoneController = TextEditingController();
  bool isOtpVisible = false;
  bool isPhoneValid = false;

  // Function to validate the phone number
  void validatePhoneNumber() {
    setState(() {
      isPhoneValid = phoneController.text.length == 10;
      if (isPhoneValid) {
        // Simulate OTP sending logic here
        isOtpVisible = true;
        // Logic to send OTP can be added here
        print('OTP sent to ${phoneController.text}');
      } else {
        isOtpVisible = false;
        // Show a message to the user that the phone number is invalid
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 10-digit phone number')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent resizing when keyboard appears

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  const Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 48,
                        color: AppColor.maintext,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // Phone number field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.subtext,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: AppColor.hintText,
                                      width: 1.0), // Border color

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(5),
                                    // ),
                                    hintText: 'Enter your phone number',
                                    border:
                                        InputBorder.none, // Removes underline
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 12.0),

                                    hintStyle: TextStyle(
                                      color: AppColor.hintText,
                                      fontSize: 14, fontWeight: FontWeight.w400,
                                      // Change to your desired color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // Aligns the button to the end

                          children: [
                            ElevatedButton(
                              onPressed: validatePhoneNumber,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      5), // Set a smaller radius
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1),
                                child: Text(
                                  'Verify',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // OTP input field - visible only after phone verification
                  if (isOtpVisible)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter OTP number',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.subtext,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return SizedBox(
                                width: 40,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    // Border color

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: TextField(controller: _controllers[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.w500
                                    ),
                                    maxLength: 1,
                                    decoration: InputDecoration(
                                      counterText: '',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor
                                                .hintText), // Set border color to grey
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor
                                                .hintText), // Set enabled border color
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColor
                                                .hintText),
                                                 // Set focused border color
                                      ),

                                    ), onChanged: (value) {
                    if (value.length == 1 && index < 5) {
                      FocusScope.of(context).nextFocus(); // Move to next field
                    } else if (value.isEmpty && index > 0) {
                      FocusScope.of(context).previousFocus(); // Move to previous field
                    }
                    // Update OTP value
                    otp = _controllers.map((controller) => controller.text).join();
                  },
                                  ),
                                  
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),

                  // Submit Button
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: ElevatedButton(
                      onPressed: 
                      otp.length == 6 ?
                      () { Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBarExample(),
                        ),
                      );
                        // Add submit logic here
                      }: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Signup Button
                  TextButton(
                    onPressed: () {
                      // Navigate to the Signup Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // ),
    );
  }
}

// Custom clipper for the curved top container
class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
