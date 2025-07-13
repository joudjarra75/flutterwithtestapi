import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterwithtestapi/models/user_model.dart';
import 'package:flutterwithtestapi/screens/user_details.dart';

List<User>? userList;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  
  @override
  void initState() {
    getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: userList == null  ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
        itemCount: userList!.length,
          itemBuilder: (_,index) {
        User user = userList![index];
      return  Card(
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => UserDetails(id: user.id, name: user.username, email: user.email, city: user.city)));
          },
          leading: Text(user.id.toString()),
          title: Text(user.username),
        ),
      );
      }),
    );
  }

  getUsers() async{
    Dio dio = Dio();
    Response response = await dio.get('https://fakestoreapi.com/users');
   List resListOfUser =  response.data;
userList = [];
  for(int i = 0 ; i < resListOfUser.length ; i++){
    Map <String,dynamic> userMap = resListOfUser[i];
   User user =  User.fromMap(userMap);
   setState(() {
     userList!.add(user);
   });
  }
  }
}
