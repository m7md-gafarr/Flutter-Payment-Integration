class Amount {
  String? total;
  String? currency;

  Amount({this.total, this.currency});

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    total: json['total'] as String?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {'total': total, 'currency': currency};
}
