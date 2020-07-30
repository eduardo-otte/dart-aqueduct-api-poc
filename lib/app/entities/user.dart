import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'transaction.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.balance,
    @required this.transactions,
    @required this.jurisdiction,
  });

  final String id;
  final String name;
  final String email;
  final String jurisdiction;
  final double balance;
  final List<Transaction> transactions;

  @override
  List<Object> get props => [
        id,
        name,
        balance,
        transactions,
      ];

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// abstract class Jurisdiction extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class BR extends Jurisdiction {}

// class TCI extends Jurisdiction {}
