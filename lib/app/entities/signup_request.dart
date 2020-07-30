import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'signup_request.g.dart';

abstract class SignupRequest extends Equatable {
  @override
  List<Object> get props => [];
}

@JsonSerializable()
class TCISignupRequest extends SignupRequest {
  TCISignupRequest({
    @required this.name,
    @required this.email,
    @required this.documentNumber,
  });

  final String name;
  final String email;
  final String documentNumber;

  // ignore: sort_constructors_first
  factory TCISignupRequest.fromJson(Map<String, dynamic> json) =>
      _$TCISignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TCISignupRequestToJson(this);
}
