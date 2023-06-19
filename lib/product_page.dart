import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  // final List data;
  final Map<String,dynamic> data2;

  final List data;
    var Id;
    ProductPage({Key? key, required this.data, this.Id, required this.data2}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    print(widget.data);
    print(widget.data2);
  }

  @override
  Widget build(BuildContext context) {
    var v = widget.data2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Page"),
      ),
      body: Center(
        child: Column(
          children: [
            // Text("${widget.data2}"),
            Text("${v['title']}"),
            Text("${v['id']}"),
            Text("${v['body']}"),
            // Text("${widget.Id}"),
            // Text("${widget.Id}"),
            // Text("${widget.Id}"),
          ],
        ),
      ),
    );
  }
}
