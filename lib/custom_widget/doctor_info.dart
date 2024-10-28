import 'package:flutter/material.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:medoloc/widgets/appbar.dart';
import 'package:medoloc/widgets/favorite_button.dart';

class DoctorInfoWidget extends StatefulWidget {
  final String name;
  final String specialty;
  final String hours;

  const DoctorInfoWidget({
    super.key,
    required this.name,
    required this.specialty,
    required this.hours,
  });

  @override
  _DoctorInfoWidgetState createState() => _DoctorInfoWidgetState();
}

class _DoctorInfoWidgetState extends State<DoctorInfoWidget> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            child: Image.asset(
              'assets/images/appImg.png',
              width: 82,
              height: 82,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name, style: medium18),
              Text(widget.specialty, style: light14),
              Text(widget.hours, style: regular13),
            ],
          ),
          const Spacer(),
          FavoriteButton(),
        ],
      ),
    );
  }
}
