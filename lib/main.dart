import 'dart:io';

import 'package:kuraimas/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(App());
}

class App extends StatelessWidget {
  final MaterialColor primary = MaterialColor(0xFFFF7A00, primaryColor);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Kuraimas",
      theme: ThemeData(
          primarySwatch: primary,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) {
        final isValidHost = ["https://api.jikan.moe"]
            .contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}
