import 'dart:convert';
import 'package:api_practice/models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Future<ProductsModel> getProductsApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/314e9380-719f-4fbe-8540-3bf12a3e504d"));
    var jsonData = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(jsonData);
    } else {
      return ProductsModel.fromJson(jsonData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products from API"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
              future: getProductsApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text(index.toString()),
                      );
                    },
                  );
                } else {
                  return Center(child: Text("Loading...!!!"));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
