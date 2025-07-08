import 'package:flutter/material.dart';
import 'package:flutterwithtestapi/screens/product_screen.dart';
import 'package:flutterwithtestapi/screens/user_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return ProductsGet();
              }));
            }, child: Text('Go to products')),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserScreen()));
            }, child: Text('Go to users'))
          ],
        ),
      ) ,
    );
  }
}
















//import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterwithtestapi/main.dart';
//
//
// List<dynamic> products = [];
//
// class BtnNav extends StatefulWidget {
//
//   const BtnNav();
//
//   @override
//   State<BtnNav> createState() => _BtnNavState();
// }
//
// class _BtnNavState extends State<BtnNav> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(onPressed: (){
//           getData();
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//             return HomePage(products: products!,);
//
//           })
//           );
//
//
//         }, child: Text('Get products')),
//       ),
//     );
//   }
//
//
// getData() async {
//   Dio dio = Dio();
//   Response res = await dio.get(
//       'https://api.escuelajs.co/api/v1/products/'); //json
//   setState(() {
//     products = res.data;
//
//   });
// }
// }
