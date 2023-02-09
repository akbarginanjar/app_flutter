import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../env.dart';
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(const LoginScreen());
    });
    return const Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Text(
          "WELCOME",
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
