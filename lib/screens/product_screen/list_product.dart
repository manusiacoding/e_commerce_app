import 'package:flutter/material.dart';
import 'package:saldah_shop/screens/home_screen/home_screen.dart';
import 'package:saldah_shop/screens/product_screen/add_product.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false),
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Center(
          child: Text('List Product Screen'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AddProductScreen()),
              (route) => false),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
