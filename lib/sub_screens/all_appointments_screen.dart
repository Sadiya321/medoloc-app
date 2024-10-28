import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/all_appointment_card.dart';
import 'package:medoloc/custom_widget/filter_button.dart';
import 'package:medoloc/models/all_appointment_model.dart';
import 'package:medoloc/screens/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/sub_screens/all_appointments_detail_screen.dart';
import 'package:medoloc/widgets/appbar.dart';

class AllAppointmentsScreen extends StatelessWidget {
  AllAppointmentsScreen({Key? key}) : super(key: key);

  Future<List<Appointment>> fetchAppointments() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(
      10,
      (index) => Appointment(
        date: '${index + 1}',
        month: 'Aug',
        daysAgo: '${index * 2} Days',
        doctorName: 'Dr. Gowri',
        prescriptionInfo: '${index % 2 + 1} Prescription${index % 2 == 0 ? 's' : ''}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          MedoLocRow(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Appointments',
                  style: semibold16,
                ),
                FilterButton(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FutureBuilder<List<Appointment>>(
                future: fetchAppointments(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error loading appointments"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("No appointments available"));
                  }

                  final appointments = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 20),
                    itemCount: appointments.length,
                    itemBuilder: (context, index) {
                      final appointment = appointments[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllAppointmentsDetailScreen(
                              // appointment: appointment,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            AllAppointmentCard(
                              date: appointment.date,
                              month: appointment.month,
                              daysAgo: appointment.daysAgo,
                              doctorName: appointment.doctorName,
                              prescriptionInfo: appointment.prescriptionInfo,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}