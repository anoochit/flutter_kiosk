import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiosk/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiosk Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.white,
        textTheme: GoogleFonts.muktaTextTheme(
          Theme.of(context).textTheme.copyWith(
                headline1: const TextStyle(color: Colors.black),
                headline2: const TextStyle(color: Colors.black),
                headline3: const TextStyle(color: Colors.black),
                headline4: const TextStyle(color: Colors.black),
                headline5: const TextStyle(color: Colors.black),
                headline6: const TextStyle(color: Colors.black),
                bodyText1: const TextStyle(color: Colors.black),
              ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
