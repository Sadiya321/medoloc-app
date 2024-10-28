


import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final String phoneNumber = '+919876543210';
  final String emailAddress = 'medlink@gmail.com';

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: emailAddress);
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Back button and logo row
            SizedBox(
            height: 30,
          ),
         MedoLocRow(),
          SizedBox(
            height: 20,
          ),
        
            
        
            // Illustration
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/contact_info.png',
                    height: 150,
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 20),
        
             Text(
              'We are here to assist you.',
              style: subtextsemibold16
            ),
        
            const SizedBox(height: 30),
        
            // Contact Info Cards with circular images
            InkWell(
              onTap: _launchPhone,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: AppColor.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/material-symbols_call-outline.png',
                          
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      phoneNumber,
                      style: medium16,
                    ),
                  ],
                ),
              ),
            ),
        
            const SizedBox(height: 15),
        
            InkWell(
              onTap: _launchEmail,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/quill_chat.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      emailAddress,
                      style: medium16
                    ),
                  ],
                ),
              ),
            ),
        
            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                    height: 43,width: 143,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement chat functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                          'assets/images/quill_chat.png',
                        ),
                                
                            SizedBox(width: 8),
                             Text(
                              'WhatApps',
                              style:semibold11
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                       height: 43,width: 143,
                      child: ElevatedButton(
                        onPressed: _launchPhone,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                          'assets/images/ri_customer-service-2-line.png',
                        ),
        
                           
                            SizedBox(width: 8),
                            Text(
                              'Talk to us',
                              style: semibold11
                            ),
                          ],
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
    );
  }
}