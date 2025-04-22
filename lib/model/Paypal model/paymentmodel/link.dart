class Link {
  String? href;
  String? rel;
  String? method;

  Link({this.href, this.rel, this.method});

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    href: json['href'] as String?,
    rel: json['rel'] as String?,
    method: json['method'] as String?,
  );

  Map<String, dynamic> toJson() => {'href': href, 'rel': rel, 'method': method};
}
