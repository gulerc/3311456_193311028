import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/Pages/HomePage.dart';

import 'LoginPage.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double currentPage = 0.0;
  final _pageViewController = new PageController();

  List images = [
    //"assets/haber1.png",
    //"assets/haber2.png"
  ];


  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
        backgroundColor: Colors.white,

        onInit: () {
      debugPrint("On Init");
    },
    onEnd: () {
    debugPrint("On End");
    },
    childWidget: SizedBox(
    height: 200,
    width: 200,
    child: Image.asset("assets/haber2.png"),
    ),
    onAnimationEnd: () => debugPrint("On Fade In End"),
    defaultNextScreen: LoginPage());
  }
}

