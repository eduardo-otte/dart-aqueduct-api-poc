import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../adapters/signup_service.dart';
import '../core/failure.dart';
import '../core/success.dart';
import '../entities/signup_request.dart';

class SignupTCIUserUsecase {
  SignupTCIUserUsecase({@required this.signupService});

  final SignupService signupService;

  Future<Either<Failure, Success>> call(TCISignupRequest signupRequest) async {
    return signupService.signupUser(signupRequest);
  }
}
