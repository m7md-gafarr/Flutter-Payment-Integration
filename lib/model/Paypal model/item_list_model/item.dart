class Item {
  String? name;
  int? quantity;
  int? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json['name'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as int?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
