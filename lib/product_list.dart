import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_aboutme/product_form_create.dart';
import 'package:my_aboutme/propuct_update.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final dio = Dio();
  final baseApi =
      "https://testpos.trainingzenter.com/lab_dpu/product/";
  late List productList = [];

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      await dio
          .get("${baseApi}list/66130099",
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ))
          .then((response) => {
                if (response.statusCode == 200)
                  {
                    setState(() {
                      productList = response.data!;
                    })
                  }
              });
    } catch (e) {
      if (!context.mounted) return;
    }
  }
    Future<void> deleteProduct(productId) async {
    try {
      await dio
      .delete("${baseApi}update/$productId",
      options: Options(
        headers: {
        'Content-Type': 'application/json',
         'Accept': 'application/json',   
        }
      ))
      .then((respone0) => {
        Navigator.pop(context, 'Cancel'),getProduct()
      });
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(productList);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Product List"),
        ),
        body: Column(
          children: [
            Align( alignment: Alignment.topRight,child: 
                         ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => const ProductFormCreate()
                                    ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(25, 177, 252, 1)),
                                child: const Text(
                                  'เพิ่มสินค้า',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Image.network(productList[index]["product_cover"]),
                        ListTile(
                          leading: const Icon(Icons.arrow_drop_down_circle),
                          title: Text(productList[index]["product_name"]),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder : (BuildContext context) => 
                                AlertDialog(
                                  title: const Text("Delete"),
                                  content: Text(
                                    "Delete ${productList[index]["product_name"]}"
                                  ),
                                  actions: <Widget>[
                                    TextButton(onPressed: () =>
                                    Navigator.pop(context, "Cancel"), 
                                    child: const Text("close"),
                                    ),
                                    TextButton(onPressed: () => {
                                      deleteProduct(productList[index]["product_id"])
                                    }, 
                                    
                                    child: const Text("OK")),
                                  ],
                                )
                                ), 
                                    style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 255, 0, 0)),
                                      child: const Text("Delete"),
                              ),
                                
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) =>  ProductUpdate(
                                    productId: productList[index]["product_id"]
                                    .toString()
                                  )));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(25, 177, 252, 1)),
                                child: const Text(
                                  'Product Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(25, 177, 252, 1)),
                                child: const Text(
                                  'รายละเอียดสินค้า',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
