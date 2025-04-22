class Payer {
  String? paymentMethod;

  Payer({this.paymentMethod});

  factory Payer.fromJson(Map<String, dynamic> json) =>
      Payer(paymentMethod: json['payment_method'] as String?);

  Map<String, dynamic> toJson() => {'payment_method': paymentMethod};
}
