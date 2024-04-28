import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate({super.key, required this.productId});
  final String productId;

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

class _ProductUpdateState extends State<ProductUpdate> {

  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/update/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();
  late String productOwner = "66130099";    
  late List productList = [];
  
  late String msg = "";

  @override
  void initState() {
    super.initState();
    getSingleProduct();
  }
  Future<void> getSingleProduct() async {
    try {
      await dio 
      .get(baseApi + widget.productId,
      options: Options(
        headers: {
          'Content-Type' : 'application/json',
          'Accept' : 'application/json',
        },
      ))
      .then((respone) => {
        if(respone.statusCode == 200)
        {
          setState(() {
            productName.text = respone.data['product_name']!;
            productCover.text = respone.data['product_cover']!;
            productDescription.text = respone.data['product_description']!;
            productPrice.text = respone.data['product_price']!;
          })
        }
      });
    } catch (e) {
      if (!context.mounted) return;
    }
  }
  
    Future<void> updateProduct() async {
      if(
          productName.text == '' ||
          productCover.text == '' ||
          productDescription.text == '' ||
          productPrice.text == ''
      ){
        setState(() {
          msg = "please fill input";
        });
      }
    try {
      await dio
          .put(baseApi+widget.productId, 
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
      setState(() {
        msg = "Invalid product update";
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Product Update"),
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
              onPressed: updateProduct, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text (
                style: TextStyle(color: Colors.blue,
                fontWeight: FontWeight.bold
                ),
                "Update"
              ))
          ],
        )
 );
  }
}