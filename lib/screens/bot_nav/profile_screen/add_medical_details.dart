import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/custom_widget.dart';
import 'package:medoloc/screens/bot_nav/profile_screen/medical_record_screen.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';


class AddMedicalRecordsScreen extends StatefulWidget {
  const AddMedicalRecordsScreen({super.key});

  @override
  State<AddMedicalRecordsScreen> createState() =>
      _AddMedicalRecordsScreenState();
}

class _AddMedicalRecordsScreenState extends State<AddMedicalRecordsScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    bloodGroupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 50,
            ),
            MedoLocRow(),
            SizedBox(
              height: 25,
            ),
            Align(alignment: Alignment.topRight,
              child: Row(
                children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Add Medical Records",style: subtextsemibold16,),
                )],
              ),
            ),SizedBox(height: 20,),
            Column(
              children: [
                // Medical Records Image
                Image.asset(
                  'assets/images/record.png', // Make sure to add this image to your assets
                  fit: BoxFit.contain,height: 144,width: 144,
                ),
                const SizedBox(height: 32),
            
                // Form Fields
                CustomTextField(
                  controller: heightController,
                  hintText: 'Enter your height',
                  labelText: 'Height',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
            
                CustomTextField(
                  controller: weightController,
                  hintText: 'Enter your weight',
                  labelText: 'Weight',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
            
                CustomTextField(
                  controller: bloodGroupController,
                  hintText: 'Enter your blood group',
                  labelText: 'Blood Group',
                ),
            
                const SizedBox(height: 20),
            
                // Submit Button
                SizedBox(height: 43,width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MedicalRecordsScreen(),
              ),
            );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColor.primary, // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}