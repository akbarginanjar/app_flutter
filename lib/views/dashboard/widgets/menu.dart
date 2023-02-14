import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../env.dart';
import '../../do_realization/de_realization.dart';
import '../../stock_opname/stock_opname.dart';

get menu => Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 55,
            child: Card(
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              borderOnForeground: true,
              elevation: 15,
              child: InkWell(
                onTap: () {
                  Get.to(
                    const StockOpname(),
                    transition: Transition.leftToRight,
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Text(
                    "Stock Opname",
                    style: GoogleFonts.montserrat(
                      color: primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 55,
            child: Card(
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              borderOnForeground: true,
              elevation: 15,
              child: InkWell(
                onTap: () {
                  Get.to(
                    const DoRealization(),
                    transition: Transition.rightToLeft,
                  );
                },
                splashColor: Colors.amber,
                child: Center(
                  child: Text(
                    "DO Realization",
                    style: GoogleFonts.montserrat(
                      color: primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
