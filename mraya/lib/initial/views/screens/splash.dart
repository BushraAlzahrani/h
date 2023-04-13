import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Get.toNamed("/");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              child: const Image(
                width: 430,
                height: 150,
                image: AssetImage('assets/splash.png'),
                alignment: Alignment.centerRight,
              ),
            )),
      ),
    );
  }
}