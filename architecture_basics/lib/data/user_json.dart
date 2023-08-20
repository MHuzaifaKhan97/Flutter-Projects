import 'package:architecture_basics/domain/entities/user.dart';

class UserJson {
  int? id;
  String? name;
  String? website;
  String? email;
  String? username;
  String? phone;

  UserJson(
      {this.id,
      this.name,
      this.website,
      this.email,
      this.username,
      this.phone});

  UserJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    website = json['website'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['website'] = website;
    data['email'] = email;
    data['username'] = username;
    data['phone'] = phone;
    return data;
  }

  User toDomain() => User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      website: website,
      username: username);
}
