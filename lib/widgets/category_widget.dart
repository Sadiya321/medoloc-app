import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/category_button.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';
import 'package:medoloc/widgets/near_by_hospitals.dart';
import 'package:medoloc/widgets/popular_doctor.dart';

class CategoryWidget extends StatefulWidget {
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String, String>> _doctors = [
    {'name': 'Dr. Jenny', 'specialization': 'Specialist Cardiologist'},
    {'name': 'Dr. Ragavan', 'specialization': 'Specialist Dentist'},
    {'name': 'Dr. Priya', 'specialization': 'Neurologist'},
    {'name': 'Dr. Aryan', 'specialization': 'Pediatrician'},
    {'name': 'Dr. Simran', 'specialization': 'Pulmonologist'},
  ];
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("All Categories", style: semibold16),
              SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  // Button with custom icon for "Dental"
                  CategoryButton(
                    iconPath:
                        'assets/icons/teeth.png', // Replace with your custom icon
                    label: 'Dental',
                  ),
                  CategoryButton(
                    iconPath:
                        'assets/icons/heart.png', // Replace with your custom icon
                    label: 'Heart',
                  ),
                  CategoryButton(
                    iconPath:
                        'assets/icons/eye.png', // Replace with your custom icon
                    label: 'Eye',
                  ),
                  CategoryButton(
                    iconPath:
                        'assets/icons/ear.png', // Replace with your custom icon
                    label: 'Ear',
                  ),
                  CategoryButton(
                    iconPath:
                        'assets/icons/face.png', // Replace with your custom icon
                    label: 'Skin',
                  ),
                  // CategoryButton(
                  //   iconPath:
                  //       'assets/icons/child.png', // Replace with your custom icon
                  //   label: 'Pediatrics',
                  // ),
                  // Add more categories as needed
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
