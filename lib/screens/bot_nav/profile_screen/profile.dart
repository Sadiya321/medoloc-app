import 'package:flutter/material.dart';
import 'package:medoloc/screens/bot_nav/profile_screen/add_medical_details.dart';
import 'package:medoloc/screens/bot_nav/profile_screen/edit_profile_screen.dart';
import 'package:medoloc/screens/bot_nav/profile_screen/medical_record_screen.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/sub_screens/all_appointments_screen.dart';
import 'package:medoloc/widgets/appbar.dart';
import '../../../aut_screen/getstart.dart';

class ProfileScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext _) => ProfileHomePage(); // Main profile page
            break;
          case '/editProfile':
            builder = (BuildContext _) => EditProfilePage(); // Inner page
            break;

          case '/appointments':
            builder = (BuildContext _) => AllAppointmentsScreen(); // Another inner page
            break;
            case '/addMedicalRecordsScreen':
            builder = (BuildContext _) => AddMedicalRecordsScreen(); // Another inner page
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          MedoLocRow(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _buildProfileSection(),
                    SizedBox(height: 30),
                    _buildEditProfileButton(context),
                    SizedBox(height: 40),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile Section
  Widget _buildProfileSection() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/Ellipse 141.png'),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Icon(Icons.edit),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text('Gaurav Sharma', style: subtextsemibold16),
      ],
    );
  }

  // Edit Profile Button (Navigates to EditProfilePage)
  Widget _buildEditProfileButton(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 43,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/editProfile');
        },
        child: Text(
          'Edit Profile',
          style: whitetsemibold16,
        ),
      ),
    );
  }

  // Action Buttons
  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildActionCard(
          imagePath: 'assets/images/all_appointment.png',
          text: 'All Appointment',
          onPressed: () {
            Navigator.of(context).pushNamed('/appointments');
          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/all_appointment.png',
          text: 'Medical Records',
          onPressed: () {
            // MedicalRecordsScreen
Navigator.of(context).pushNamed('/addMedicalRecordsScreen');          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/support.png',
          text: '24*7 Customer Support',
          onPressed: () {
            // Implement Customer Support action
          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/privicy.png',
          text: 'Privacy Policy',
          onPressed: () {
            // Implement Privacy Policy action
          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/terms.png',
          text: 'Terms and Condition',
          onPressed: () {
            // Implement Terms and Condition action
          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/share.png',
          text: 'Share',
          onPressed: () {
            // Implement Share action
          },
        ),
        SizedBox(height: 20),
        _buildActionCard(
          imagePath: 'assets/images/ant-design_logout-outlined.png',
          text: 'LogOut',
          onPressed: () {
            _showLogoutDialog(context);
          },
        ),
        SizedBox(height: 25),
      ],
    );
  }

  // Reusable Action Card Widget
  Widget _buildActionCard({
    required String imagePath,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 330,
      height: 68,
      child: Card(
        color: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 28,
            height: 28,
            fit: BoxFit.cover,
          ),
          title: Text(text, style: textsemibold),
          onTap: onPressed,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
      ),
    );
  }

  // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text(
            'Log Out',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          content: Text('Are you sure you want to logout?', style: regular16),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => GetStartedScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
