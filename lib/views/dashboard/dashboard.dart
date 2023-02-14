import 'package:app_flutter/views/dashboard/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../env.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      primary,
                      primary,
                      // Colors.deepOrange
                    ],
                    center: Alignment(0.9, -0.8),
                    focal: Alignment(0.3, -0.5),
                    focalRadius: 2.0,
                  ),
                ),
              ),
              headerWidget
            ],
          ),
          const SizedBox(height: 10),
        ],
      )),
    );
  }
}
