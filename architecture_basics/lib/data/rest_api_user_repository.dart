import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/data/user_json.dart';
import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApiUserRepository implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    return list.map((e) => UserJson.fromJson(e).toDomain()).toList();
  }
}
