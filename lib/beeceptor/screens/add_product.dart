import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterwithtestapi/beeceptor/model/productModel.dart';

class AddProduct extends StatefulWidget {
  Productmodel? productmodel;
   AddProduct({this.productmodel});

  @override
  State<AddProduct> createState() => _AddProductState();
}


class _AddProductState extends State<AddProduct> {

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController des = TextEditingController();
  bool isEdit = false;
  bool isPost = false;
  @override
  void initState() {
    super.initState();
    if(widget.productmodel != null){
      isEdit = true;
      name.text = widget.productmodel!.name;
      price.text = widget.productmodel!.price;
      des.text = widget.productmodel!.description;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit? 'Edit product' :'Add new product'),
      ),
      body: isPost ?LinearProgressIndicator() :Column(
        children: [
          TextFormField(
            controller: name,
            decoration: InputDecoration(
            labelText: 'Name',
          ),
          ), TextFormField(
            controller:price,
            decoration: InputDecoration(
            labelText: 'Price',
          ),
          ), TextFormField(
            controller: des,
            decoration: InputDecoration(
            labelText: 'Description',
          ),
          ),
          
          ElevatedButton(onPressed: (){
            addProduct();
          }, child:isEdit?Text('Edit'):Text('Add product'))
        ],
      ),
    );
  }
  
  addProduct() async{
    Dio dio = Dio();
    Map<String,dynamic> data = {
      "name": name.text,
      "price":price.text,
      "description":des.text
    };
   setState(() {
     isPost = true;
   });
   if(isEdit) {
     dio.put('https://shopapp99.free.beeceptor.com/api/product/${widget.productmodel!.id}',
     data: data);
   }
   else {
     await dio.post('https://shopapp99.free.beeceptor.com/api/product',
         data: data);
   }
setState(() {
  isPost = false;
});
    Navigator.of(context).pop(true);
    setState(() {
      name.clear();
      price.clear();
      des.clear();
    });
  }

}
