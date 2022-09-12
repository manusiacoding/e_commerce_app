import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saldah_shop/app/app_consts.dart';
import 'package:saldah_shop/screens/product_screen/list_product.dart';
import 'package:saldah_shop/size_config.dart';

const List<String> list = <String>['Shirt', 'Dress', 'Jeans', 'Shoes', 'Hat'];

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // SearchController type = SearchController;
  final TextEditingController name = TextEditingController(),
      price = TextEditingController(),
      qty = TextEditingController(),
      description = TextEditingController();
  bool loading = false;
  File? _imageFile;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String dropdownValue = list.first;
    return Scaffold(
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
      body: loading
          ? Center(
              child: CircularProgressIndicator(color: AppColors.darkGrey),
            )
          : ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      image: _imageFile == null
                          ? null
                          : DecorationImage(
                              image: FileImage(_imageFile ?? File('')),
                              fit: BoxFit.cover,
                            )),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.image, size: 50, color: Colors.black38),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: name,
                          keyboardType: TextInputType.text,
                          validator: (val) =>
                              val!.isEmpty ? 'Product name is required.' : null,
                          decoration: InputDecoration(
                            hintText: "Product Name",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.darkGrey),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: price,
                          keyboardType: TextInputType.text,
                          validator: (val) => val!.isEmpty
                              ? 'Product price is required.'
                              : null,
                          decoration: InputDecoration(
                            hintText: "Product Price",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.darkGrey),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: qty,
                          keyboardType: TextInputType.text,
                          validator: (val) =>
                              val!.isEmpty ? 'Product qty is required.' : null,
                          decoration: InputDecoration(
                            hintText: "Product Qty",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.darkGrey),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                          ),
                          items: ["Shirt", "Dress", "Jeans", 'Shoes', 'Hat'],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Product Type",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.darkGrey),
                              ),
                            ),
                          ),
                          onChanged: print,
                          selectedItem: "Brazil",
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: description,
                          keyboardType: TextInputType.multiline,
                          maxLines: 9,
                          validator: (val) => val!.isEmpty
                              ? 'Product description is required.'
                              : null,
                          decoration: InputDecoration(
                            hintText: 'Product Description',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.darkGrey),
                            ),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(25)),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.darkGrey),
                                ),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = !loading;
                                    });
                                  }
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
