import 'package:app_flutter/env.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StockOpname extends StatelessWidget {
  const StockOpname({super.key});

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
    );
  }
}
