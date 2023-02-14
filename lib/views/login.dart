import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: primary),
                  ),
                ),
                const SizedBox(height: 7),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Silahkan Login",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey, letterSpacing: 1),
                  ),
                ),
                const SizedBox(height: 15),
                Form(
                  key: form,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Username",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
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
                              Get.offAll(
                                const MainScreen(),
                                transition: Transition.leftToRight,
                              );
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
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
