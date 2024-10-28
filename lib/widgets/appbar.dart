import 'package:flutter/material.dart';
import 'package:medoloc/custom_widget/custom_back_button.dart';
import 'package:medoloc/strings/app_color.dart';

class MedoLocRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Mask group (1).png',
              width: 46,
              height: 43,
            ),
            SizedBox(width: 5),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Medo",
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "Loc",
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColor.textsub,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 46), // To balance the back button width
      ],
    );
  }
}