import 'package:flutter/material.dart';
import 'package:saldah_shop/screens/product_screen/list_product.dart';

class AddProductScreen extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => ListProductScreen()),
                  (route) => false),
              icon: Icon(Icons.arrow_back),
              color: Colors.black),
        ),
        body: Center(
          child: Text('Add Product Screen'),
        ),
      ),
    );
  }
}
