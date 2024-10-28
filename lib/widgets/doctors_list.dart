import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/screens/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:medoloc/widgets/find_and_appont_list.dart';
import 'package:medoloc/widgets/search_bar.dart';

class DoctorListScreen extends StatefulWidget {
  final String initialSearchQuery;

  const DoctorListScreen({
    Key? key,
    this.initialSearchQuery = '',
  }) : super(key: key);

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  final List<Map<String, String>> _doctors = [
    {
      'name': 'Dr. Jenny',
      'specialization': 'Specialist Cardiologist',
      'time': '10:00 AM - 9:00 PM'
    },
    {
      'name': 'Dr. Ragavan',
      'specialization': 'Specialist Dentist',
      'time': '10:00 AM - 9:00 PM'
    },
    {
      'name': 'Dr. Priya',
      'specialization': 'Neurologist',
      'time': '10:00 AM - 9:00 PM'
    },
    {
      'name': 'Dr. Aryan',
      'specialization': 'Pediatrician',
      'time': '10:00 AM - 9:00 PM'
    },
    {
      'name': 'Dr. Simran',
      'specialization': 'Pulmonologist',
      'time': '10:00 AM - 9:00 PM'
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchText = widget.initialSearchQuery;
    _searchController.text = widget.initialSearchQuery;
  }

  List<Map<String, String>> get filteredDoctors {
    if (_searchText.isEmpty) {
      return _doctors;
    }
    return _doctors.where((doctor) {
      final name = doctor['name']?.toLowerCase() ?? '';
      final specialization = doctor['specialization']?.toLowerCase() ?? '';
      return name.contains(_searchText.toLowerCase()) ||
          specialization.contains(_searchText.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 211,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Rectangle 502.png'), // Your uploaded background image
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Mask group.png',
                        width: 46, // Adjust width as needed
                        height: 43,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      const Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Centering horizontally
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Medo",
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Loc",
                            style: TextStyle(
                              fontSize: 32,
                              color: AppColor.textsub,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),

                // Search Bar
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search a doctor...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(27.0),
                            borderSide: BorderSide.none,
                          ),
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(
                                  6.0), // Adjust padding as needed
                              decoration: const BoxDecoration(
                                color:
                                    AppColor.primary, // Change color as needed
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchText = value.toLowerCase();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = filteredDoctors[index];
                      return DoctorAppointmentCard(
                        name: doctor['name']!,
                        specialization: doctor['specialization']!,
                        timings: '10:00 AM - 4:00 PM',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailsScreen(
                                  // Enable editing

                                  ),
                            ),
                          );
                        },
                      );
                    },
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
