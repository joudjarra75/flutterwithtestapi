class Productmodel {
  String id;
  String name;
  String price;
  String description;

  Productmodel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
  });

  factory Productmodel.toMap(Map <String ,dynamic> map){
    return Productmodel(id: map['id'], name: map['name'], price: map['price'], description: map['description']??'nothing');
  }
}
