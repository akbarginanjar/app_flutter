import 'dart:async';
import 'dart:io';

import 'package:app_flutter/env.dart';
import 'package:app_flutter/views/login.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/opname_code_model.dart';

class OpnameCodeController extends GetConnect {
  Future<OpnameCode> getOpnameCode({required String code}) async {
    try {
      final String token = GetStorage().read('token');
      // code = await FlutterBarcodeScanner.scanBarcode(
      //     '#009922', 'CANCEL', true, ScanMode.DEFAULT);
      final query = {
        "code": code,
      };
      final conn = await get('$url/StockOpname/GetOpnameCode',
          headers: {'authorization': 'Bearer $token'}, query: query);
      if (conn.statusCode == 200) {
        print(conn.body);
        return OpnameCode.fromJson(conn.body);
      } else if (conn.statusCode == 401) {
        Get.offAll(const LoginScreen());
        Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
      }
      // Get.snackbar('Terjadi Masalah', conn.body['message']);
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
      // print('$e, ${e.stackTrace}');
    }

    return OpnameCode();
  }
}
