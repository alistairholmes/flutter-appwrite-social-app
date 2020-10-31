class UserFields {
  static const String id = "\$id";
  static const String name = "name";
  static const String email = "email";
}

class User {
  String id;
  String email;
  String name;

  User({this.id, this.email, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json[UserFields.id];
    email = json[UserFields.email];
    name = json[UserFields.name];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[UserFields.id] = this.id;
    data[UserFields.email] = this.email;
    data[UserFields.name] = this.name;
    return data;
  }
}
