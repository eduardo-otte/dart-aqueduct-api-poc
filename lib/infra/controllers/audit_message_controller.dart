import 'package:dart_aqueduct_poc/dart_aqueduct_poc.dart';

class AuditMessageController extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final flowId = request.attachments['x-flow-id'];
    final userId = request.attachments['x-user-id'];
    final method = request.method;
    final uri = request.path.string;

    final message = '[$flowId] Starting [$method] $uri for user [$userId]';
    logger.info(message);

    return request;
  }
}
