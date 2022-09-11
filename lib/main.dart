import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saldah_shop/screens/loading_screen/loading.dart';
// import 'package:saldah_shop/screens/signin_screen/signin_screen.dart';
// import 'package:saldah_shop/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saldah Shop',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoadingScreen(),
    );
  }
}
