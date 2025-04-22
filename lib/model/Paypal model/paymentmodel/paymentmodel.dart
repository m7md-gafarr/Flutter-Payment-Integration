import 'link.dart';
import 'payer.dart';
import 'transaction.dart';

class Paymentmodel {
  String? id;
  String? intent;
  String? state;
  Payer? payer;
  List<Transaction>? transactions;
  String? createTime;
  List<Link>? links;

  Paymentmodel({
    this.id,
    this.intent,
    this.state,
    this.payer,
    this.transactions,
    this.createTime,
    this.links,
  });

  factory Paymentmodel.fromJson(Map<String, dynamic> json) => Paymentmodel(
    id: json['id'] as String?,
    intent: json['intent'] as String?,
    state: json['state'] as String?,
    payer:
        json['payer'] == null
            ? null
            : Payer.fromJson(json['payer'] as Map<String, dynamic>),
    transactions:
        (json['transactions'] as List<dynamic>?)
            ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
            .toList(),
    createTime: json['create_time'] as String?,
    links:
        (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'intent': intent,
    'state': state,
    'payer': payer?.toJson(),
    'transactions': transactions?.map((e) => e.toJson()).toList(),
    'create_time': createTime,
    'links': links?.map((e) => e.toJson()).toList(),
  };
}
