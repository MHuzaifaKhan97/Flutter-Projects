import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/domain/failures/user_list_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<UserListFailure, List<User>>> getUsers();
}
