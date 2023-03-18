import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
   bool isButtonDisabled; // change to color not required there will be deafult
   Function() onPressed;
  CustomButton({super.key, required this.text, required this.isButtonDisabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(300, 44),
            backgroundColor: isButtonDisabled? Color(0xffbDEC2C0): Colors.redAccent,
            // padding: EdgeInsets.only(left: 90, right: 90),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
