import 'dart:convert';

class Currency {
  final String code;
  final String name;
  final double rateToPrimary;
  final int isPrimary;
  final int status;

  Currency({
    required this.code,
    required this.name,
    required this.rateToPrimary,
    required this.isPrimary,
    required this.status,
  });

  factory Currency.fromJson(String str) => Currency.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Currency.fromMap(Map<String, dynamic> json) => Currency(
    code: json["code"],
    name: json["name"],
    rateToPrimary: (json["rate_to_primary"] as num).toDouble(),
    isPrimary: json["is_primary"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "name": name,
    "rate_to_primary": rateToPrimary,
    "is_primary": isPrimary,
    "status": status,
  };
}
