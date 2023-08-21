import 'package:architecture_basics/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
