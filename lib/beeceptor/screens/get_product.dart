import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterwithtestapi/beeceptor/model/productModel.dart';
import 'package:flutterwithtestapi/beeceptor/screens/add_product.dart';

class GetProduct extends StatefulWidget {
  const GetProduct({super.key});

  @override
  State<GetProduct> createState() => _GetProductState();
}

List<Productmodel>? products;

class _GetProductState extends State<GetProduct> {

  @override
  void initState() {
    getData();
    super.initState();
  }
  bool isRefresh = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          products! == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  if(isRefresh)
                    LinearProgressIndicator(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: products!.length,
                      itemBuilder: (_, index) {
                        Productmodel product = products![index];
                        return SizedBox(
                          height: 100,
                            child: InkWell(
                              onTap: (){
                                openAddPage(product);
                              },
                              child: Card(
                                  child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(product.name),
                                      IconButton(onPressed: (){
                                        deleteProduct(product);
                                      }, icon: Icon(Icons.delete),color: Colors.red,)
                                    ],
                                  )
                                ],
                              )),
                            ));
                      },
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        openAddPage(null);
      }

      ,child: Icon(Icons.add),),
    );
  }

  getData() async {
    Dio dio = Dio();
    Response response = await dio.get(
      'https://shopapp99.free.beeceptor.com/api/product',
    );
    List productTest = response.data;
    products = [];
    for (int i = 0; i < productTest.length; i++) {
      Map<String, dynamic> productItem = productTest[i];
      Productmodel productmodel = Productmodel.toMap(productItem);
     setState(() {
       products!.add(productmodel);
     });
  setState(() {
    isRefresh = false;
  });
    }
  }

  deleteProduct(Productmodel product) async {
    setState(() {
      isRefresh = true;
    });
    Dio dio = Dio();
    Response response = await dio.delete(
      'https://shopapp99.free.beeceptor.com/api/product/${product.id}',
    );
    getData();
  }

  openAddPage(Productmodel? product) async{
    dynamic result = await Navigator.push(context, MaterialPageRoute(builder: (_)=>AddProduct(productmodel: product,)));
    if(result is bool){
      getData();
    }
    else{
      print('close');
    }
  }
}
