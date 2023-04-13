import 'package:flutter/material.dart';
import 'package:mraya/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  //  bool isButtonDisabled; // change to color not required there will be deafult
   Color color;
   Color textColor;
   Function() onPressed;
  CustomButton({super.key, 
  
  required this.text,
  required this.color, required this.textColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        
          style: ElevatedButton.styleFrom(
            elevation:0,
            side: BorderSide(color: mainColor),
            fixedSize: Size(300, 44),
            backgroundColor: color,
            // padding: EdgeInsets.only(left: 90, right: 90),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: textColor),)),
    );
  }
}
