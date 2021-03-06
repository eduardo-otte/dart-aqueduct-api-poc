import 'package:aqueduct/aqueduct.dart';
import 'package:meta/meta.dart';

import '../../app/usecases/find_br_user_usecase.dart';

class BRUserController extends ResourceController {
  BRUserController({@required this.findBRUserUsecase});

  final FindBRUserUsecase findBRUserUsecase;

  @Operation.get('id')
  Future<Response> getUserById(@Bind.path('id') String userId) async {
    logger.info('Finding user');
    final failureOrUser = await findBRUserUsecase(userId);

    return failureOrUser.fold(
      (failure) => Response.notFound(),
      (user) => Response.ok(user),
    );
  }
}
