import 'package:app_flutter/views/login.dart';
import 'package:app_flutter/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: GetStorage().read('token') != null
          ? const MainScreen()
          : const LoginScreen(),
      duration: 4000,
      imageSize: 30,
      imageSrc: "assets/image/hikaron.jpg",
      backgroundColor: Colors.white,
    );
  }
}
