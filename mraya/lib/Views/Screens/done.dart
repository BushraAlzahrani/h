import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils.dart';
import '../Widgets/customButton.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage('assets/done.png'),
              height: 400,
              width: 400,
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Done',
              textColor: Colors.white,
              color: mainColor,
              onPressed: () {
                // the dall-e function
              },
            ),
            SizedBox(
              height: 15,
            ),
          ],
        )),
      ),
    ));
  }
}
