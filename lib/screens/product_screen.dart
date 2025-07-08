import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


List<dynamic>? products ;

class ProductsGet extends StatefulWidget {
  const ProductsGet({super.key});

  @override
  State<ProductsGet> createState() => _ProductsGetState();
}

class _ProductsGetState extends State<ProductsGet> {

@override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: products != null ?
        ListView.builder(
            itemCount: products!.length,
            itemBuilder: (context, index) {
              Map <String, dynamic> singleProduct = products![index];
              return Card(
                child: ListTile(
                  leading: Text(singleProduct['id'].toString()),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(singleProduct['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                      ),
                      Text(singleProduct['price'].toString())
                    ],),
                ),
              );
            }) : Center(child: CircularProgressIndicator()),
      ),
    );
  }


  getData() async {
    Dio dio = Dio();
    Response res = await dio.get(
        'https://api.escuelajs.co/api/v1/products/'); //json
    setState(() {
      products = res.data;

    });
  }
}
