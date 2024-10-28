import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';

class MedicalRecordsScreen extends StatefulWidget {
  @override
  State<MedicalRecordsScreen> createState() => _MedicalRecordsScreenState();
}

class _MedicalRecordsScreenState extends State<MedicalRecordsScreen> {
  // Initial image paths for each record type
  List<String> recordImagePaths = [
    'assets/images/Group.png', // Default for Report
    'assets/images/unmidGroup.png', // Default for Prescription
    'assets/images/lastGroup.png', // Default for X-ray
  ];

  // Function to update the image for a specific record type based on its index
  void _onRecordTypeTap(int index) {
    setState(() {
      // Define the new image for each record type
      List<String> newImages = [
        'assets/images/grcolGroup.png', // Image for Report when tapped
        'assets/images/midGroup.png', // Image for Prescription when tapped
        'assets/images/colGroup.png', // Image for X-ray when tapped
      ];

      // Update the image for the tapped index only
      recordImagePaths[index] = newImages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          MedoLocRow(),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text('My Medical Records', style: subtextsemibold16),SizedBox(width: 80,),
                        Expanded(
                          child: SizedBox(width: 10,height: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8,left:10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor
                                      .primary, // Green color for the button
                                  foregroundColor:
                                      Colors.white, // Same color as other elements
                                  // Equal vertical padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: () {
                                  // Action to be performed when the Edit button is pressed
                                  print('Edit button pressed');
                                },
                                child: Text(
                                  'Edit',
                                  style:
                                      TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Main image displayed in the center
                    Center(
                      child: Image.asset(
                        'assets/images/record.png', // Main image remains static
                        width: 144,
                        height: 144,
                      ),
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Container(
                          height: 292,
                          width: 335,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        _buildTaskDetailRow("Height", " "),
                                        _buildTaskDetailRow("Weight", " "),
                                        _buildTaskDetailRow("Blood Group", " "),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Type of record',
                                style: semibold16
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Individual record types
                                  _buildRecordType(
                                    imagePath: recordImagePaths[0],
                                    label: 'Report',
                                    onTap: () {
                                      _onRecordTypeTap(
                                          0); // Update the Report item
                                    },
                                  ),
                                  _buildRecordType(
                                    imagePath: recordImagePaths[1],
                                    label: 'Prescription',
                                    onTap: () {
                                      _onRecordTypeTap(
                                          1); // Update the Prescription item
                                    },
                                  ),
                                  _buildRecordType(
                                    imagePath: recordImagePaths[2],
                                    label: 'X-ray',
                                    onTap: () {
                                      _onRecordTypeTap(
                                          2); // Update the X-ray item
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                        height:
                            50), // Space between the records section and buttons
                    Row(
                      children: [
                        SizedBox(width: 20), // Space between the two buttons
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor
                                  .primary, // Green color for the button
                              foregroundColor:
                                  Colors.white, // Same color as other elements
                              padding: EdgeInsets.symmetric(
                                  vertical: 15), // Equal vertical padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Action to be performed when the Add Records button is pressed
                              print('Add Records button pressed');
                            },
                            child: Text(
                              'Upload & Add Record',
                              style:
                                  whitetsemibold16
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Add spacing from bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the row for task details (Height, Weight, Blood Group)
  Widget _buildTaskDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              "$label",
              style: subtextsemibold16,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ":",
              style: subtextsemibold16,
            ),
          ),
          Expanded(
            flex: 9,
            child: Text(
              value,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: subregular16,
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the record type with image and label
  Widget _buildRecordType({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap, // Handle the tap event
      child: Column(
        children: [
          Image.asset(
            imagePath, // Use the dynamic image path based on index
            width: 46,
            height: 43,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
