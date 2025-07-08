class User {
  int id;
  String email;
  String username;
String city;
   User(this.id,this.email,this.username,this.city);

  factory User.toMap(Map <String,dynamic> map){
    String city = map['address']['city'];
    return User(map['id'], map['email'], map['username'],city);
  } //named const
}