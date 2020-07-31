import 'package:dart_aqueduct_poc/dart_aqueduct_poc.dart';

class AuthorizationController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final authorization = request.raw.headers.value('authorization');

    if (authorization == 'Authorization ok') {
      logger.info('Authorized');
      return request;
    }

    logger.info('Unauthorized');
    return Response.unauthorized();
  }
}
