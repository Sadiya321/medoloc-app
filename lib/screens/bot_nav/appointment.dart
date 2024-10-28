import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';

// Model for Appointment
class Appointment {
  final String doctorName;
  final DateTime dateTime;
  final String status; // 'today', 'upcoming', or 'history'

  Appointment({
    required this.doctorName,
    required this.dateTime,
    required this.status,
  });
  
}

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Appointment> appointments = [
    Appointment(
      doctorName: 'Dr. Gowri',
      dateTime: DateTime.now().add(Duration(hours: 2)),
      status: 'today',
    ),
    Appointment(
      doctorName: 'Dr. Smith',
      dateTime: DateTime.now().add(Duration(days: 2)),
      status: 'upcoming',
    ),
    Appointment(
      doctorName: 'Dr. Johnson',
      dateTime: DateTime.now().subtract(Duration(days: 2)),
      status: 'history',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          MedoLocRow(),
            
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 35),
                child: Text("Check Appointment", style: subtextsemibold16),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            height: 47,
            color: AppColor.primary,
            child: TabBar(
              labelStyle: semibold13,
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "Today"),
                Tab(text: "Upcoming"),
                Tab(text: "History"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAppointmentList('today'),
                _buildAppointmentList('upcoming'),
                _buildAppointmentList('history'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentList(String status) {
    final filteredAppointments =
        appointments.where((apt) => apt.status == status).toList();

    if (filteredAppointments.isEmpty) {
      return Center(
        child: Text(
          "No ${status.capitalize()} Appointments",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        return _buildAppointmentCard(filteredAppointments[index]);
      },
    );
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    String timeStatus = _getTimeStatus(appointment.dateTime);
    bool isToday = appointment.status == 'today';

    return SizedBox(
      height: 110,
      width: 335,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 55,
                    height: 60,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, 
                      children: [
                        Text(
                          appointment.dateTime.day.toString(),
                          style: medium14
                        ),
                        Text(
                          _getMonth(appointment.dateTime),
                          style: medium14
                        ),
                      ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: isToday 
                        ? const Color.fromARGB(53, 14, 190, 128)
                        : const Color.fromARGB(53, 14, 190, 128),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      timeStatus,
                      style: medium12
                    ),
                  ),
                ],
              ),
            ),
            // Rest of your card content remains the same
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You Have Appointment ${appointment.status.capitalize()}",
                      style: subtextmedium
                    ),
                    SizedBox(height: 4),
                    Text(
                      appointment.doctorName,
                      style: subtextregular12
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Timing: ${_formatTime(appointment.dateTime)}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeStatus(DateTime appointmentTime) {
    final now = DateTime.now();
    final difference = appointmentTime.difference(now);
    
    // For past appointments
    if (difference.isNegative) {
      final days = difference.inDays.abs();
      if (days == 0) return 'Today';
      if (days == 1) return 'Yesterday';
      return '$days Days Ago';
    }
    
    // For future appointments
    final days = difference.inDays;
    if (days == 0) {
      if (appointmentTime.day == now.day) return 'Today';
      return 'Tomorrow';
    }
    if (days == 1) return 'Tomorrow';
    return '$days Days';
  }
  String _getMonth(DateTime date) {
    return [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ][date.month - 1];
  }

  String _getDay(DateTime date) {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][date.weekday - 1]
        .substring(0, 3);
  }

  String _formatTime(DateTime date) {
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${date.minute.toString().padLeft(2, '0')} $period';
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
