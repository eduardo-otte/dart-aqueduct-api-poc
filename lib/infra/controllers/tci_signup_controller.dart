import 'package:meta/meta.dart';

import '../../app/entities/signup_request.dart';
import '../../app/usecases/signup_tci_user_usecase.dart';
import '../../dart_aqueduct_poc.dart';

class TCISignupController extends ResourceController {
  TCISignupController({@required this.signupTCIUserUsecase});

  final SignupTCIUserUsecase signupTCIUserUsecase;

  @Operation.post()
  Future<Response> signupUser(
    @Bind.body() TCISignupRequest signupRequest,
  ) async {
    final failureOrSuccess = await signupTCIUserUsecase(signupRequest);

    return failureOrSuccess.fold(
      // TODO: set exception
      (failure) => throw Exception(),
      (success) => Response.ok('Signup successful'),
    );
  }
}
