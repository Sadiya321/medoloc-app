import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/widgets/doctors_list.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({super.key});

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search a doctor...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(27.0),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          onTap: () {
            // Navigate to the DoctorListScreen when the search bar is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorListScreen(
                  initialSearchQuery: _searchController.text,
                ),
              ),
            );
          },
          // Make the TextField read-only since we're using it as a button
          readOnly: true,
        ),
      ),
    );
  }
}