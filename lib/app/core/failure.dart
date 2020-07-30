import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure(String userId)
      : super(message: "User with id $userId not found");
}

class UserRepositoryFailure extends Failure {
  const UserRepositoryFailure(String userEmail)
      : super(message: "Failed to create user with email $userEmail");
}

class SignupServiceFailure extends Failure {
  const SignupServiceFailure(String userEmail)
      : super(message: "Failed to signup user with email $userEmail");
}
