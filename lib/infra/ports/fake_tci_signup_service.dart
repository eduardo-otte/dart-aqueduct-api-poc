import 'package:dartz/dartz.dart';

import '../../app/adapters/signup_service.dart';
import '../../app/core/failure.dart';
import '../../app/core/success.dart';
import '../../app/entities/signup_request.dart';

class FakeTCISignupService implements SignupService<TCISignupRequest> {
  @override
  Future<Either<Failure, Success>> signupUser(
      TCISignupRequest signupRequest) async {
    if (signupRequest.email == "fail@mctest.com") {
      return Left(SignupServiceFailure(signupRequest.email));
    }

    await Future.delayed(const Duration(seconds: 1));

    return Right(Success());
  }
}
