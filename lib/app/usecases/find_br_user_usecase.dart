import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../adapters/repositories/br_user_repository.dart';
import '../core/failure.dart';
import '../entities/user.dart';

class FindBRUserUsecase {
  FindBRUserUsecase({@required this.userRepository});

  final BRUserRepository userRepository;

  Future<Either<Failure, User>> call(String userId) async {
    return userRepository.getUserById(userId);
  }
}
