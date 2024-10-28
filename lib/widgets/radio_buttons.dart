import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart'; // Ensure this path is correct

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int _selectedGender = 0; // Default value, you can change as needed
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender',
            style: subtextsemibold16,// Assuming this is a valid color
       
          ),
          SizedBox(height: 10),
          Row(
            children: List.generate(3, (index) {
              final genderLabels = ['Male', 'Female', 'Others'];
              return Expanded(
                child: Row(
                  children: [
                    Radio(
                      value: index,
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                    ),
                    Text(
                      genderLabels[index],
                      style: radiotext,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
