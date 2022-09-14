import 'package:flutter/material.dart';
import 'package:saldah_shop/app/app_consts.dart';
import 'package:saldah_shop/models/api_response.dart';
import 'package:saldah_shop/models/product.dart';
import 'package:saldah_shop/screens/home_screen/home_screen.dart';
import 'package:saldah_shop/screens/product_screen/add_product.dart';
import 'package:saldah_shop/screens/signin_screen/signin_screen.dart';
import 'package:saldah_shop/services/product_services.dart';
import 'package:saldah_shop/services/user_services.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen({super.key});

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  List<dynamic> _productList = [];
  int userid = 0;
  bool loading = true;

  Future<void> retrieveProducts() async {
    userid = await getUserId();
    ApiResponse response = await getProducts();

    if (response.error == null) {
      setState(() {
        _productList = response.data as List<dynamic>;
        loading = loading ? !loading : loading;
      });
    } else if (response.error == unauthorized) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignInScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveProducts();
  }

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
          color: Colors.black,
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _productList.length,
              itemBuilder: (BuildContext context, int i) {
                Product product = _productList[i];
                return Text('${product.name}');
              },
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
