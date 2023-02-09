import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../env.dart';
import '../main.dart';
import '../services/auth_service.dart';
import 'main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController pass = TextEditingController();
    AuthController authController = AuthController();
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 130),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: primary),
                  ),
                ),
                const SizedBox(height: 7),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Silahkan Login",
                    style: TextStyle(color: Colors.grey, letterSpacing: 1),
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: form,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 55,
                        padding: const EdgeInsets.only(top: 2, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                          controller: username,
                          cursorColor: primary,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 55,
                        padding: const EdgeInsets.only(top: 2, left: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                          controller: pass,
                          cursorColor: primary,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 27),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          authController
                              .login(
                            username: username.text,
                            pass: pass.text,
                          )
                              .then((value) {
                            if (box.read('token') != null) {
                              form.currentState!.reset();
                              Get.offAll(const MainScreen());
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
