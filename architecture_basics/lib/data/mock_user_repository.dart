import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/domain/repository/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<List<User>> getUsers() async => [
        User(
          id: 1,
          username: "Huzaifa khan",
          name: "Muhammad Huzaifa",
          email: "huzaifa@gmail.com",
          website: "huzaifa.com",
          phone: "+923122282334",
        )
      ];
}
