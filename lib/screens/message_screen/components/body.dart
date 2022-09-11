import 'package:flutter/material.dart';
import 'package:saldah_shop/screens/home_screen/home_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false),
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
      ),
      body: Center(
        child: Text('Message Screen'),
      ),
    );
  }
}
