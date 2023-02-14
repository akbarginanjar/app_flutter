import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'menu.dart';

get headerWidget => Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  GetStorage().read('user')['usernama'].toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(62, 63, 63, 63),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              margin: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 20, top: 20),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 25,
                            width: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/image/hikaron.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: menu,
            ),
          ],
        ),
      ],
    );
