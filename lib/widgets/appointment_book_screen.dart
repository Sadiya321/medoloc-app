// In AppointmentBookingScreen
import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/doctor_info.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appointment_success_screen.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/date_picker.dart';
import 'package:medoloc/widgets/reminder_chip.dart';
import 'package:medoloc/widgets/time_slot.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  _AppointmentBookingScreenState createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  String? _selectedTimeSlot; // Store the selected time slot
  String? _selectedReminder; // Store the selected reminder

  void _selectTimeSlot(String time) {
    setState(() {
      _selectedTimeSlot = time; // Update the selected time slot
    });
  }

  void _selectReminder(String reminder) {
    setState(() {
      _selectedReminder = reminder; // Update the selected reminder
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              MedoLocRow(),
              SizedBox(
                height: 20,
              ),
              // Doctor Info Section using DoctorContainer
              SingleChildScrollView(
                child: Column(
                  children: [
                    DoctorInfoWidget(
                      name: 'Dr. Jenny',
                      specialty: 'Specialist Cardiologist',
                      hours: '10:00 AM - 4:00 PM',
                    ),

                    SizedBox(height: 24),
                    //  Date Picker Section
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Pick a date', style: medium16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: DatePickerWidget(
                        focusedDay: _focusedDay,
                        selectedDay: _selectedDay,
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        onPageChanged: (focusedDay) {
                          setState(() {
                            _focusedDay =
                                focusedDay; // Update focused day when page changes
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Time Selection Section
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text('Select Time', style: medium16),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TimeSlotWidget('10:00\nAM',
                              isSelected: _selectedTimeSlot == '10:00\nAM',
                              onTap: () => _selectTimeSlot('10:00\nAM')),
                          TimeSlotWidget('12:00\nAM',
                              isSelected: _selectedTimeSlot == '12:00\nAM',
                              onTap: () => _selectTimeSlot('12:00\nAM')),
                          TimeSlotWidget('02:00\nPM',
                              isSelected: _selectedTimeSlot == '02:00\nPM',
                              onTap: () => _selectTimeSlot('02:00\nPM')),
                          TimeSlotWidget('03:00\nPM',
                              isSelected: _selectedTimeSlot == '03:00\nPM',
                              onTap: () => _selectTimeSlot('03:00\nPM')),
                          TimeSlotWidget('04:00\nPM',
                              isSelected: _selectedTimeSlot == '04:00\nPM',
                              onTap: () => _selectTimeSlot('04:00\nPM')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Reminder Section
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Reminder Me Before',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ReminderChipWidget('50\nMins',
                              isSelected: _selectedReminder == '50\nMins',
                              onTap: () => _selectReminder('50\nMins')),
                          ReminderChipWidget('40\nMins',
                              isSelected: _selectedReminder == '40\nMins',
                              onTap: () => _selectReminder('40\nMins')),
                          ReminderChipWidget('25\nMins',
                              isSelected: _selectedReminder == '25\nMins',
                              onTap: () => _selectReminder('25\nMins')),
                          ReminderChipWidget('10\nMins',
                              isSelected: _selectedReminder == '10\nMins',
                              onTap: () => _selectReminder('10\nMins')),
                          ReminderChipWidget('5\nMins',
                              isSelected: _selectedReminder == '5\nMins',
                              onTap: () => _selectReminder('5\nMins')),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Confirm Button
                    Center(
                      child: SizedBox(
                        width: 250,height: 43,
                        child: ElevatedButton(
                          onPressed: () {
                             Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AppointmentSuccessScreen()),
                                        );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2A9D8F),
                            // padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child:  Text(
                            'Confirm',
                            style: whitetsemibold16
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
      ),
    );
  }
}
