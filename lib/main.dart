import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterwithtestapi/beeceptor/screens/get_product.dart';
import 'package:flutterwithtestapi/screens/nav.dart';
import 'package:flutterwithtestapi/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}
//list of product
List<dynamic> products = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: GetProduct()
    );
  }
}


class HomePage extends StatefulWidget {
  List products;
   HomePage({ required this.products});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: products != null ?
        ListView.builder(
          itemCount: widget.products.length,
            itemBuilder: (context, index) {
              Map <String, dynamic> singleProduct = products![index];
              return Card(
                child: ListTile(
                  leading: Text(singleProduct['id'].toString()),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(singleProduct['title']),
                      Text(singleProduct['price'].toString())
                    ],),
                ),
              );
            }) : Center(child: Text('Not found')),
      ),
    );
  }
}



