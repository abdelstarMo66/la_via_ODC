import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../login_module/signin_screen.dart';

class Splash_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  SplashScreenView(
      navigateRoute: Login_Screen(),
      duration: 3000,
      imageSize: 136,
      pageRouteTransition: PageRouteTransition.SlideTransition,
      imageSrc: "assets/image/la_via.png",
      backgroundColor: Colors.white,
    );
  }
}
