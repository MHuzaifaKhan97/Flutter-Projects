import 'package:equatable/equatable.dart';

class User extends Equatable {
  int? id;
  String? name;
  String? website;
  String? email;
  String? username;
  String? phone;

  User(
      {this.id,
      this.name,
      this.website,
      this.email,
      this.username,
      this.phone});

  // On basis of props object compares
  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        phone,
        website,
      ];
}