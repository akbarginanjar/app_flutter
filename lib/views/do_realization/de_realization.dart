import 'package:app_flutter/env.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoRealization extends StatelessWidget {
  const DoRealization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DO Realization",
          style: GoogleFonts.montserrat(),
        ),
        backgroundColor: primary,
        elevation: 10,
      ),
    );
  }
}
