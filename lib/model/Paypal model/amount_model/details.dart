class Details {
  int? subtotal;
  int? shipping;
  int? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    subtotal: json['subtotal'] as int?,
    shipping: json['shipping'] as int?,
    shippingDiscount: json['shipping_discount'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
}
