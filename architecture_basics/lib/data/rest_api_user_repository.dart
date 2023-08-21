import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/data/user_json.dart';
import 'package:architecture_basics/domain/failures/user_list_failure.dart';
import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApiUserRepository implements UserRepository {
  @override
  Future<Either<UserListFailure, List<User>>> getUsers() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      // return right() for success
      return right(list.map((e) => UserJson.fromJson(e).toDomain()).toList());
    } catch (e) {
      // return left() for failure
      return left(UserListFailure(error: e.toString()));
    }
  }
}
