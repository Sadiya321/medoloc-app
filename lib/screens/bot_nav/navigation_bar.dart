import 'package:flutter/material.dart';
import 'package:medoloc/screens/bot_nav/profile_screen/profile.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/sub_screens/sos_screen.dart';
import 'home.dart';
import 'appointment.dart';
import 'fav_doc.dart';

class BottomNavBarExample extends StatefulWidget {
  @override
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _selectedIndex = 0;
  bool _isSosScreenActive = false; // Tracks if SosScreen is active

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isSosScreenActive = false; // Disable SosScreen when navigating to other tabs
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteDoctorsScreen(),
    AppointmentScreen(),
    ProfileScreenHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_selectedIndex], // Display selected bottom navigation page
          if (_isSosScreenActive) SosScreen(), // Overlay SosScreen if active
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isSosScreenActive = true; // Show SosScreen overlay
          });
        },
        backgroundColor: const Color.fromARGB(255, 215, 3, 3),
        shape: const CircleBorder(),
        child: Text(
          "SOS",
          style: whitesemi14,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 75,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: AppColor.maintext,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: 35.0,
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 0 ? Colors.greenAccent : Colors.blueGrey,
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
                const SizedBox(width: 20),
                IconButton(
                  iconSize: 35.0,
                  icon: Icon(
                    Icons.favorite_border,
                    color: _selectedIndex == 1 ? Colors.greenAccent : Colors.blueGrey,
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  iconSize: 35.0,
                  icon: Icon(
                    Icons.event_note,
                    color: _selectedIndex == 2 ? Colors.greenAccent : Colors.blueGrey,
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
                const SizedBox(width: 20),
                IconButton(
                  iconSize: 35.0,
                  icon: Icon(
                    Icons.person_outline,
                    color: _selectedIndex == 3 ? Colors.greenAccent : Colors.blueGrey,
                  ),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
