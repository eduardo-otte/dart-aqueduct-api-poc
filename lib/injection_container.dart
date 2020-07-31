import 'package:get_it/get_it.dart';

import 'app/adapters/repositories/br_user_repository.dart';
import 'app/adapters/signup_service.dart';
import 'app/usecases/find_br_user_usecase.dart';
import 'app/usecases/signup_tci_user_usecase.dart';
import 'infra/controllers/audit_message_controller.dart';
import 'infra/controllers/authorization_controller.dart';
import 'infra/controllers/br_user_controller.dart';
import 'infra/controllers/flow_identifier_controller.dart';
import 'infra/controllers/tci_signup_controller.dart';
import 'infra/ports/fake_tci_signup_service.dart';
import 'infra/ports/repositories/fake_br_user_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Repositorioes/Services
  sl.registerSingleton<BRUserRepository>(FakeBRUserRepository());
  sl.registerSingleton<SignupService>(FakeTCISignupService());

  // Usecases
  sl.registerSingleton<FindBRUserUsecase>(
    FindBRUserUsecase(
      userRepository: sl.get<BRUserRepository>(),
    ),
  );

  sl.registerSingleton<SignupTCIUserUsecase>(
    SignupTCIUserUsecase(
      signupService: sl.get<SignupService>(),
    ),
  );

  // Controllers

  sl.registerSingleton<AuthorizationController>(AuthorizationController());

  sl.registerSingleton<FlowIdentifierController>(FlowIdentifierController());

  sl.registerSingleton<AuditMessageController>(AuditMessageController());

  sl.registerSingleton<BRUserController>(
    BRUserController(
      findBRUserUsecase: sl.get<FindBRUserUsecase>(),
    ),
  );

  sl.registerSingleton<TCISignupController>(
    TCISignupController(
      signupTCIUserUsecase: sl.get<SignupTCIUserUsecase>(),
    ),
  );
}
