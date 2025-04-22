import 'amount.dart';

class Transaction {
  Amount? amount;
  String? description;
  List<dynamic>? relatedResources;

  Transaction({this.amount, this.description, this.relatedResources});

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    amount:
        json['amount'] == null
            ? null
            : Amount.fromJson(json['amount'] as Map<String, dynamic>),
    description: json['description'] as String?,
    relatedResources: json['related_resources'] as List<dynamic>?,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'related_resources': relatedResources,
  };
}
