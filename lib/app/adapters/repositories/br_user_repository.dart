import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../entities/user.dart';

abstract class BRUserRepository {
  Future<Either<Failure, User>> getUserById(String id);
}
