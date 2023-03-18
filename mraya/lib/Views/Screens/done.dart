import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            
            children: [
              Image(
                  image: AssetImage('assets/done.png'),
                  height: 400,
                  width: 400,
                ),
                SizedBox(height: 15,),
                FloatingActionButton.extended(
                  
  label: Text('Done'), 
  // <-- Text
  backgroundColor: Color.fromARGB(255, 172, 94, 94),
  onPressed: () {},
),
                ],)  ),
        ),
    ));
  }
}