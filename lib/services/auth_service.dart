import 'dart:async';
import 'dart:io';

import 'package:app_flutter/env.dart';
import 'package:app_flutter/models/user_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetConnect {
  Future<User> login({required String username, required String pass}) async {
    try {
      if (pass.isNotEmpty && username.isNotEmpty) {
        GetStorage box = GetStorage();
        var body = {
          "username": username,
          "pass": pass,
        };
        EasyLoading.show(
          status: 'loading...',
        );
        final Response conn = await get('$url/Login', query: body);
        if (conn.statusCode == 200) {
          EasyLoading.showSuccess('Login Berhasil!');
          box.write('token', conn.body['token']);
          box.write('user', conn.body);
          return User.fromJson(conn.body);
        } else {
          EasyLoading.showError('Akun Tidak Ditemukan!');
        }
        // Get.snackbar("Gagal Login", conn.body['message']);
      }
    } on TimeoutException {
      Get.snackbar('Masalah Koneksi',
          'Jaringan lemah\nsilahkan perbaiki jaringan anda!');
    } on SocketException {
      Get.snackbar('Masalah Koneksi',
          'Data dalam keadaan mati\nsilahkan nyalakan data anda!');
    } on HttpException catch (e) {
      Get.snackbar('Masalah Koneksi', e.message);
    } on Error catch (e) {
      Get.snackbar(e.toString(), e.stackTrace.toString());
    }
    return User();
  }
}
