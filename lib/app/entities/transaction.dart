import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  const Transaction({
    @required this.amount,
    @required this.transactionType,
    @required this.description,
    @required this.date,
  });

  final double amount;
  final String transactionType;
  final String description;
  final DateTime date;

  @override
  List<Object> get props => [
        amount,
        transactionType,
        description,
        date,
      ];

  // ignore: sort_constructors_first
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}

// @JsonSerializable()
// abstract class TransactionType extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// @JsonSerializable()
// class Credit extends TransactionType {}

// @JsonSerializable()
// class Debit extends TransactionType {}
