import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductFormCreate extends StatefulWidget {
  const ProductFormCreate({super.key});

  @override
  State<ProductFormCreate> createState() => _ProductFormCreateState();
}

class _ProductFormCreateState extends State<ProductFormCreate> {

  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/create/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();
  late String productOwner = "66130099";    
  late List productList = [];
  
  late String msg = "";

  Future<void> createProduct() async {
    try {
      await dio
          .post(baseApi,
          data: {
                "product_name": productName.text,
                "product_cover": productCover.text,
                "product_description": productDescription.text,
                "product_price": productPrice.text,
                "product_owner": productOwner,
          },
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((response) => {Navigator.pushNamed(context, "product")

              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Add Product"),
        ),
        body : Column(
          children: [
            if (msg != "")
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(msg ,
              style: TextStyle(color: Colors.red[800]),
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productName,
                decoration: const InputDecoration(
                border: OutlineInputBorder(), 
                labelText: "ชื่อสินค้า"
              ),
              ),
            ),
                        Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productCover,
                decoration: const InputDecoration(
                border: OutlineInputBorder(), 
                labelText: "รูปภาพ"
              ),
              ),
            ),
                                    Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productDescription,
                decoration: const InputDecoration(
                border: OutlineInputBorder(), 
                labelText: "details"
              ),
              ),
            ),
                                    Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: productPrice,
                decoration: const InputDecoration(
                border: OutlineInputBorder(), 
                labelText: "Price"
              ),
              ),
            ),
            TextButton(
              onPressed: createProduct, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text (
                style: TextStyle(color: Colors.blue,
                fontWeight: FontWeight.bold
                ),
                "create"
              ))
          ],
        )
 );
  }
}