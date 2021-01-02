import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:haberApp/utils/homepage.dart';
import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      backgroundColor: Colors.black,
      curve: Curves.decelerate,
      splash: Icon(
        Icons.all_inclusive,
        color: Colors.white,
        size: 200,
      ),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
    );
  }
}
