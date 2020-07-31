import 'dart_aqueduct_poc.dart';
import 'infra/controllers/audit_message_controller.dart';
import 'infra/controllers/authorization_controller.dart';
import 'infra/controllers/br_user_controller.dart';
import 'infra/controllers/flow_identifier_controller.dart';
import 'infra/controllers/tci_signup_controller.dart';
import 'injection_container.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class DartAqueductPocChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    await init();

    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route('/br/users/[:id]')
        .link(() => sl.get<AuthorizationController>())
        .link(() => sl.get<FlowIdentifierController>())
        .link(() => sl.get<AuditMessageController>())
        .link(() => sl.get<BRUserController>());

    router
        .route('/tci/signup')
        .link(() => sl.get<FlowIdentifierController>())
        .link(() => sl.get<AuditMessageController>())
        .link(() => sl.get<TCISignupController>());

    return router;
  }
}
