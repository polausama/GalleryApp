class User{
  int? id;
  String? email;
  String? password;
  String?name;

  User({this.id,this.email, this.password,this.name});

   User.fromjson(Map<String,dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }
}