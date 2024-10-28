import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/custom_widget.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/widgets/radio_buttons.dart';
import '../screens/bot_nav/navigation_bar.dart'; // Import the navigation bar

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final FocusNode _focusNode = FocusNode();
  String otp = "";
  int _selectedGender = 0; // Default gender is 'Male'

  // Controllers for TextFields
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool showOtpFields = false;
  bool isPhoneValid = true;
  bool isNameValid = true;
  bool isEmailValid = true;
  bool isAgeValid = true;

  // Function to validate email using regex
  bool validateEmail(String email) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Function to validate age
  bool validateAge(String age) {
    try {
      int ageValue = int.parse(age);
      return ageValue > 0 && ageValue < 120; // Age should be between 1 and 119
    } catch (e) {
      return false; // Age is not a valid number
    }
  }

  // Validate all fields
  bool validateFields() {
    bool isValid = true;

    // Name validation
    if (nameController.text.isEmpty) {
      setState(() {
        isNameValid = false;
      });
      isValid = false;
    } else {
      setState(() {
        isNameValid = true;
      });
    }

    // Email validation
    if (!validateEmail(emailController.text)) {
      setState(() {
        isEmailValid = false;
      });
      isValid = false;
    } else {
      setState(() {
        isEmailValid = true;
      });
    }

    // Age validation
    if (!validateAge(ageController.text)) {
      setState(() {
        isAgeValid = false;
      });
      isValid = false;
    } else {
      setState(() {
        isAgeValid = true;
      });
    }

    return isValid;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 130,
                ),
                // Top curved container with Signup title
                const Center(
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 48,
                      color: AppColor.maintext,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            
                // Name field
                Expanded(
                  child: SingleChildScrollView(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            controller: nameController,
                            hintText: 'Enter your full name',
                            labelText: 'Name',
                            errorText:
                                isNameValid ? null : 'Name cannot be empty',
                          ),
                           CustomTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      errorText: isEmailValid ? null : 'Enter a valid email',
                    ),
                      
            
             
                // Phone number field with Verify button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Enter your phone number',
                      labelText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      errorText: isPhoneValid
                          ? null
                          : 'Please enter a valid 10-digit phone number',
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 250),
                          child: ElevatedButton(
                            onPressed: () {
                              String phoneNumber = phoneController.text;
                              if (phoneNumber.length == 10) {
                                setState(() {
                                  showOtpFields = true;
                                  isPhoneValid = true;
                                  // Add OTP sending logic here
                                });
                              } else {
                                setState(() {
                                  isPhoneValid = false;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            
                // OTP input field, visible only after the "Verify" button is clicked
                if (showOtpFields)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Enter OTP number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.subtext,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
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
                                          color: AppColor.hintText),
                                      // Set focused border color
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 1 && index < 5) {
                                      FocusScope.of(context)
                                          .nextFocus(); // Move to next field
                                    } else if (value.isEmpty && index > 0) {
                                      FocusScope.of(context)
                                          .previousFocus(); // Move to previous field
                                    }
                                    // Update OTP value
                                    otp = _controllers
                                        .map((controller) => controller.text)
                                        .join();
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
            
                // Age field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: ageController,
                      hintText: 'Enter your age',
                      labelText: 'Age',
                      keyboardType: TextInputType.number,
                      errorText: isAgeValid ? null : 'Enter a valid age',
                    ),
                  ],
                ),
            
                // Gender selection field (Radio buttons)
                GenderSelection(),
            
                // Submit Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (validateFields()) {
                        // Navigate to the home page (navigation_bar.dart) after signing up
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BottomNavBarExample(), // Navigate to BottomNavBarExample
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),  ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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