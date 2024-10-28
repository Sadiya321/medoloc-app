import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/radio_buttons.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  int _selectedGender = 0; // Default gender is 'Male'

  String _address = '';
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
              height: 50,
            ),
            MedoLocRow(),
            SizedBox(
              height: 20,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 30),
                    _buildProfileImage(),
                    const SizedBox(height: 30),
                    _buildProfileField(
                      label: 'Name',
                      initialValue: 'Gaurav Sharma',
                      onSaved: (value) => _name = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    _buildProfileField(
                      label: 'Email',
                      initialValue: 'gourav123@gmail.com',
                      onSaved: (value) => _email = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    _buildProfileField(
                      label: 'Phone Number',
                      initialValue: '+91 9807869540',
                      onSaved: (value) => _phoneNumber = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!RegExp(r'^\+?[0-9]{10,13}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    _buildProfileField(
                      label: 'Address',
                      initialValue:
                          'Maruthihalli, 4th street, 3rd cross, MangaloreMangaloreMangaloreMangaloreMangaloreMangaloreMangaloreMangalore',
                      onSaved: (value) => _address = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    _buildProfileField(
                      label: 'Age',
                      initialValue: '20',
                      onSaved: (value) => _phoneNumber = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!RegExp(r'^\+?[0-9]{10,13}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                 GenderSelection(),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        'Update Profile',
                        style: TextStyle(fontSize: 18, color: AppColor.white),
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build Profile Image
  Widget _buildProfileImage() {
    return Column(
      children: [
        Stack(
          children: [
            // Main profile picture
            SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/images/Ellipse 141.png', // Placeholder image
                ),
              ),
            ),
            // Small badge image at bottom right
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.circular(5), // Set the border radius here

                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: SizedBox(
                  height: 18,
                  width: 18,
                  child: Icon(Icons.edit),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Build Profile Fields
Widget _buildProfileField({
  required String label,
  required String initialValue,
  required FormFieldSetter<String> onSaved,
  required FormFieldValidator<String> validator,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: subtextsemibold16,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.subtext,
          ),
          initialValue: initialValue,
          maxLines: label == 'Address' ? 2 : 1, // Allow 2 lines for address field
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: label == 'Address' ? 20 : 14, // Increased vertical padding for address
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            filled: true,
            fillColor: AppColor.white,
          ),
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    ),
  );
}
  // Submit Form Method
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
      // Here you can save the user's data
    }
  }
}

