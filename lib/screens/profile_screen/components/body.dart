import 'package:flutter/material.dart';
import 'package:saldah_shop/screens/home_screen/home_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
        child: Text('Profile Screen'),
      ),
    );
  }
}
