import 'package:uuid/uuid.dart';

import '../../dart_aqueduct_poc.dart';

class FlowIdentifierController extends Controller {
  FlowIdentifierController() : uuid = Uuid();

  final Uuid uuid;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final flowIdHeader = request.raw.headers.value('x-flow-id');
    final flowId = _getFlowId(flowIdHeader);
    logger.info('Request flow ID: $flowId');

    request.attachments['x-flow-id'] = flowId;
    request.addResponseModifier((response) {
      response.headers['x-flow-id'] = flowId;
    });

    final userId = request.raw.headers.value('x-user-id');
    request.attachments['x-user-id'] = userId;

    return request;
  }

  String _getFlowId(String flowIdHeader) {
    logger.info('Incoming flow ID: $flowIdHeader');
    return flowIdHeader ?? uuid.v4();
  }
}
