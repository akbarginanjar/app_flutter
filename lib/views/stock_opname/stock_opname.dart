import 'package:app_flutter/env.dart';
import 'package:app_flutter/models/opname_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/barang_model.dart';
import '../../services/opname_code_service.dart';

class StockOpname extends StatefulWidget {
  const StockOpname({super.key});

  @override
  State<StockOpname> createState() => _StockOpnameState();
}

class _StockOpnameState extends State<StockOpname> {
  // TextEditingController qrCode = TextEditingController();
  // TextEditingController code = TextEditingController();
  OpnameCodeController opnameCodeController = OpnameCodeController();
  String code = '';
  String qrCode = '';
  // ignore: prefer_typing_uninitialized_variables
  var trigerOpname;
  // ignore: prefer_typing_uninitialized_variables
  var trigerBarang;
  // String getcode = '';

  // Future scanbarcode() async {
  //   getcode = await FlutterBarcodeScanner.scanBarcode(
  //       '#009922', 'CANCEL', true, ScanMode.DEFAULT);
  // }

  checkScan() async {
    // await opnameCodeController.getOpnameCode(code: code.text);
    code = await FlutterBarcodeScanner.scanBarcode(
        '#009922', 'CANCEL', true, ScanMode.DEFAULT);
    setState(() {
      trigerOpname = OpnameCode();
    });
  }

  @override
  void initState() {
    trigerOpname = OpnameCode();
    trigerBarang = Barang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stock Opname",
          style: GoogleFonts.montserrat(),
        ),
        backgroundColor: primary,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Opname Code',
              style: GoogleFonts.montserrat(),
            ),
            const SizedBox(height: 6),
            // TextFormField(
            //   controller: code,
            // ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // scanbarcode();
                  // opnameCodeController.getOpnameCode(code: code.text);
                  checkScan();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black54,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Scan QR",
                      style: GoogleFonts.montserrat(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder<OpnameCode>(
                future: OpnameCodeController().getOpnameCode(code: code),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 12),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Cut Off Date",
                                style: GoogleFonts.montserrat())),
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            snapshot.data!.stockopnameDate == null
                                ? '-'
                                : snapshot.data!.stockopnameDate.toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // TextFormField(
                        //   controller: TextEditingController(
                        //       text: snapshot.data!.stockopnameOid.toString()),
                        // ),
                        // TextFormField(
                        //   controller: qrCode,
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     opnameCodeController.getBarang(
                        //       opnameOid:
                        //           snapshot.data!.stockopnameOid.toString(),
                        //       qrCode: qrCode.text,
                        //     );
                        //   },
                        //   child: const Text('cek'),
                        // )

                        const Divider(),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'QR Code',
                            style: GoogleFonts.montserrat(),
                          ),
                        ),
                        // TextFormField(
                        //   controller: qrCode,
                        // ),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () async {
                              // scanbarcode();
                              // opnameCodeController.getOpnameCode(code: code.text);

                              qrCode = await FlutterBarcodeScanner.scanBarcode(
                                  '#009922', 'CANCEL', true, ScanMode.DEFAULT);
                              // opnameCodeController.getBarang(
                              //   opnameOid:
                              //       snapshot.data!.stockopnameOid.toString(),
                              //   qrCode: qrCode,
                              // );
                              setState(() {
                                trigerBarang = Barang();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 10,
                              shadowColor: Colors.black54,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.qr_code,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Scan Barang",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        FutureBuilder<Barang>(
                            future: OpnameCodeController().getBarang(
                                opnameOid:
                                    snapshot.data!.stockopnameOid.toString(),
                                qrCode: qrCode),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Code : ',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                            snapshot.data!
                                                        .stockopnamedBarcode ==
                                                    null
                                                ? '-'
                                                : snapshot
                                                    .data!.stockopnamedBarcode
                                                    .toString(),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17)),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Text(
                                          'Design : ',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                            snapshot.data!.designName == null
                                                ? '-'
                                                : snapshot.data!.designName
                                                    .toString(),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17)),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Text(
                                          'Color : ',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                            snapshot.data!.colorCode == null
                                                ? '-'
                                                : snapshot.data!.colorCode
                                                    .toString(),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17)),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Text(
                                          'Qty : ',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 17),
                                        ),
                                        Text(
                                            snapshot.data!.stockopnamedQty ==
                                                    null
                                                ? '-'
                                                : snapshot.data!.stockopnamedQty
                                                    .toString(),
                                            style: GoogleFonts.montserrat(
                                                fontSize: 17)),
                                      ],
                                    ),
                                    const Divider(),
                                  ],
                                );
                              }
                              return const CircularProgressIndicator(
                                color: Color.fromARGB(255, 199, 199, 199),
                              );
                            }),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 199, 199, 199),
                    ),
                  );
                }),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 37,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 24, 175, 29),
                        elevation: 10,
                        shadowColor: Colors.black54,
                      ),
                      child: Text('New Data', style: GoogleFonts.montserrat()),
                    ),
                  ),
                ),
                const SizedBox(width: 13),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 37,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 10,
                        shadowColor: Colors.black54,
                      ),
                      child: Text('Save', style: GoogleFonts.montserrat()),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
