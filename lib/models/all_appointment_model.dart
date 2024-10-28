// lib/models/appointment_model.dart
class Appointment {
  final String date;
  final String month;
  final String daysAgo;
  final String doctorName;
  final String prescriptionInfo;

  Appointment({
    required this.date,
    required this.month,
    required this.daysAgo,
    required this.doctorName,
    required this.prescriptionInfo,
  });
}
