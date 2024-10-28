import 'package:flutter/material.dart';

Widget bgWidget({
  Widget? child,
}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/login.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}