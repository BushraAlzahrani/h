import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Widgets/customButton.dart';
import '../Widgets/proudctCard.dart';

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffbEAF0EF),
      body: SingleChildScrollView (
        child: Column(
          children: [
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return ProudctCard();
                }),
                SizedBox(height: 100,),
                CustomButton(text: 'Continue', isButtonDisabled: false,),
                CustomButton(text: 'show me another suggestion ', isButtonDisabled: true,),
      
          ],
        ),
      ),
    ));
  }
}
