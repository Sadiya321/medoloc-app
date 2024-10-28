import 'package:flutter/material.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text('Filter', style: medgreen14),
          SizedBox(width: 8.0),
          Icon(
            Icons.filter_list,
            color: AppColor.maintext,
            size: 14.86,
          ),
        ],
      ),
    );
  }
}
