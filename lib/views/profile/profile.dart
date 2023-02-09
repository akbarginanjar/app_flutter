import 'package:app_flutter/env.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../main.dart';
import '../login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () async {
              // ignore: unused_local_variable
              final action = await AlertDialogs.yesCancelDialog(
                  context, 'Logout', 'Apakah anda ingin keluar?');
            },
            child: const Icon(
              Icons.logout_outlined,
              color: primary,
            ),
          )
        ],
        elevation: 0,
        title: const Text(
          "PROFILE",
          style: TextStyle(
            color: primary,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/user.png'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              GetStorage().read('user')['usernama'].toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Text(
              GetStorage().read('user')['useremail'].toString(),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlertDialogs {
  static yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    // ignore: unused_local_variable
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  "Tidak",
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  box.remove('token');
                  Get.offAll(const LoginScreen());
                },
                child: const Text(
                  "Ya",
                  style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
        });
  }
}
