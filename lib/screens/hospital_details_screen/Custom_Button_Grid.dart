import 'package:flutter/material.dart';
import 'package:medoloc/strings/strings.dart';

class CustomButtonGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        color: Colors.white, 
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            _buildCustomButton('assets/images/ri_direction-fill.png', "Direction"),
            _buildCustomButton('assets/images/healthicons_doctor-male.png', "All Doctor"),
            _buildCustomButton('assets/images/material-symbols_share.png', "Share"),
            _buildCustomButton( 'assets/images/material-symbols-light_call.png' , "  Call  "),
            _buildCustomButton('assets/images/ic_baseline-whatsapp.png', "WhatsApp"),
            _buildCustomButton('assets/images/mdi_web.png', "Website"),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(String imagePath, String label) {
    return Material(
      elevation: 2.0, // Custom elevation
      borderRadius: BorderRadius.circular(15.0), // Rounded edges
      color: Colors.white, // Set the color here to make ripple visible
      child: InkWell(
        onTap: () {
          // Handle button tap
        },
        borderRadius: BorderRadius.circular(15.0),
        splashColor: Colors.teal.withOpacity(0.3), // Customize ripple effect
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                 width: 16.35,
                height: 16.35,
              ),
              SizedBox(width: 8), // Space between icon and text
             Text(label, style: medgreen14),
            ],
          ),
        ),
      ),
    );
  }
}