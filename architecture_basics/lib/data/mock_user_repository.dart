import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/domain/failures/user_list_failure.dart';
import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<Either<UserListFailure, List<User>>> getUsers() async => right([
        User(
          id: 1,
          username: "Huzaifa khan",
          name: "Muhammad Huzaifa",
          email: "huzaifa@gmail.com",
          website: "huzaifa.com",
          phone: "+923122282334",
        )
      ]);
}
