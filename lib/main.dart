import 'package:be_mine/pages/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      home: PageContainerView(),
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
        fontFamily: GoogleFonts.montserrat(
                // fontStyle: FontStyle.normal,
                // height: 1.6,
                // letterSpacing: 2,
                // wordSpacing: 1,
                )
            .fontFamily,
      ),
    ),
  );
}
