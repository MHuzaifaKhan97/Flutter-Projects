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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['website'] = this.website;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    return data;
  }
}
