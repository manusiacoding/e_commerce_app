import 'package:flutter/material.dart';
import 'package:saldah_shop/screens/product_screen/components/add_product.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('List Product Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => AddProductScreen()),
            (route) => false),
        child: Icon(Icons.add),
      ),
    );
  }
}
