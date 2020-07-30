import 'package:dartz/dartz.dart';

import '../core/failure.dart';
import '../core/success.dart';
import '../entities/signup_request.dart';

abstract class SignupService<R extends SignupRequest> {
  Future<Either<Failure, Success>> signupUser(R signupRequest);
}
