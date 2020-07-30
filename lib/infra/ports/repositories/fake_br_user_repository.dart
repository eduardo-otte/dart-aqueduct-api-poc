import 'package:dartz/dartz.dart';

import '../../../app/adapters/repositories/br_user_repository.dart';
import '../../../app/core/failure.dart';
import '../../../app/entities/user.dart';

class FakeBRUserRepository implements BRUserRepository {
  @override
  Future<Either<Failure, User>> getUserById(String id) async {
    if (id == "123") {
      return const Right(
        User(
          id: "123",
          name: "Test McTest",
          email: "test@mctest.com",
          balance: 5.0,
          transactions: null,
          jurisdiction: "BR",
        ),
      );
    }

    return Left(UserNotFoundFailure(id));
  }
}
