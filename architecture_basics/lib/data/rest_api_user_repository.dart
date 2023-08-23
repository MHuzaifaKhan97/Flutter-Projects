import 'package:architecture_basics/domain/entities/user.dart';
import 'package:architecture_basics/data/user_json.dart';
import 'package:architecture_basics/domain/failures/user_list_failure.dart';
import 'package:architecture_basics/domain/repository/user_repository.dart';
import 'package:architecture_basics/network/network_repository.dart';
import 'package:dartz/dartz.dart';

class RestApiUserRepository implements UserRepository {
  final NetworkRepository _networkRepository;
  RestApiUserRepository(this._networkRepository);
  @override
  Future<Either<UserListFailure, List<User>>> getUsers() => _networkRepository
      .get("https://jsonplaceholder.typicode.com/users")
      .then((value) =>
          // return left() for failure
          value.fold((l) => left(UserListFailure(error: l.error)), (r) {
            var list = r as List;
            // return right() for success
            return right(
                list.map((e) => UserJson.fromJson(e).toDomain()).toList());
          }));
}
