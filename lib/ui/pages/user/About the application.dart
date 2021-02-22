import 'package:exchange_shop/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class AboutTheApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appbar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22),
          ),
        ),
        title: Text('About the application '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      color: Color(0xff6bc8c6),
                      height: 150.0,
                      width: 120.0,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '  About',
                  style: GoogleFonts.palanquin(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,

                ),
              ],
            ),
            Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Exchange of currencies today in Palestine in shekels in front of all currencies in the world.\n '
                    'Today is cuurency exchange rate in palestine is an application that enables you to see the shekel exhange rate against 4 other currencies around the world. \n'
                    'You can browse the app with ease the currency rates in palestine.\n'
                        'Advantages of applying currency rates today in Palestine:\n'
                        '*-easy to use.\n'
                        '*-fast.\n'
                        '*-very light,it is does not talk uo space on your mobile.\n'
                        '*-Simple and elegant design\n'
                        '*-Easily navigate the app is pages\n'
                        'Applying currency rates today in Palestine makes it easier for you to track currency rates.\n'
                        'Any note or complaint we be happy to receive via e-mail. ',
                    style: GoogleFonts.palanquin(
                       color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold

                    ),
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
