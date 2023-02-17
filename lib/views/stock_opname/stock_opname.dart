import 'package:app_flutter/env.dart';
import 'package:app_flutter/models/opname_code_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/opname_code_service.dart';

class StockOpname extends StatefulWidget {
  const StockOpname({super.key});

  @override
  State<StockOpname> createState() => _StockOpnameState();
}

class _StockOpnameState extends State<StockOpname> {
  // TextEditingController code = TextEditingController();
  OpnameCodeController opnameCodeController = OpnameCodeController();
  String code = '';
  // ignore: prefer_typing_uninitialized_variables
  var triger;
  // String getcode = '';

  // Future scanbarcode() async {
  //   getcode = await FlutterBarcodeScanner.scanBarcode(
  //       '#009922', 'CANCEL', true, ScanMode.DEFAULT);
  // }

  checkScan() async {
    await opnameCodeController.getOpnameCode(code: code);
    code = await FlutterBarcodeScanner.scanBarcode(
        '#009922', 'CANCEL', true, ScanMode.DEFAULT);
    setState(() {
      triger = OpnameCode();
    });
  }

  @override
  void initState() {
    triger = OpnameCode();
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
                      ],
                    );
                  }
                  return const CircularProgressIndicator(
                    color: Color.fromARGB(255, 199, 199, 199),
                  );
                }),
            const Divider(),
            const SizedBox(height: 30),
            Text(
              'QR Code',
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
                  // checkScan();
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
                      style: GoogleFonts.montserrat(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Code : ',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                Text('-', style: GoogleFonts.montserrat(fontSize: 20)),
              ],
            ),
            const Divider(),

            Row(
              children: [
                Text(
                  'Design : ',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                Text('-', style: GoogleFonts.montserrat(fontSize: 20)),
              ],
            ),
            const Divider(),

            Row(
              children: [
                Text(
                  'Color : ',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                Text('-', style: GoogleFonts.montserrat(fontSize: 20)),
              ],
            ),
            const Divider(),

            Row(
              children: [
                Text(
                  'Qty : ',
                  style: GoogleFonts.montserrat(fontSize: 20),
                ),
                Text('-', style: GoogleFonts.montserrat(fontSize: 20)),
              ],
            ),
            const Divider(),
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
                      child: Text('New Data', style: GoogleFonts.montserrat()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 24, 175, 29),
                        elevation: 10,
                        shadowColor: Colors.black54,
                      ),
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
                      child: Text('Save', style: GoogleFonts.montserrat()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 10,
                        shadowColor: Colors.black54,
                      ),
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
