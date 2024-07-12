// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:goldenchaincoin/models/TypeHistorique.dart';

class Historique {

  String name;
  String type;
  double price;
  String symbol;
  String description;
  Historique({
    required this.name,
    required this.type,
    required this.price,
    required this.symbol,
    required this.description,
  });

  Historique copyWith({
    String? name,
    String? type,
    double? price,
    String? symbol,
    String? description,
  }) {
    return Historique(
      name: name ?? this.name,
      type: type ?? this.type,
      price: price ?? this.price,
      symbol: symbol ?? this.symbol,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'price': price,
      'symbol': symbol,
      'description': description,
    };
  }

  factory Historique.fromMap(Map<String, dynamic> map) {
    return Historique(
      name: map['name'] as String,
      type: map['type'] as String,
      price: double.parse( map['price'].toString()),
      symbol: map['symbol'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Historique.fromJson(String source) => Historique.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Historique(name: $name, type: $type, price: $price, symbol: $symbol, description: $description)';
  }

  @override
  bool operator ==(covariant Historique other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.type == type &&
      other.price == price &&
      other.symbol == symbol &&
      other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      type.hashCode ^
      price.hashCode ^
      symbol.hashCode ^
      description.hashCode;
  }
  }
