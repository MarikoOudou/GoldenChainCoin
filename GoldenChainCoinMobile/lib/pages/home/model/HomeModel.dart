// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:goldenchaincoin/models/Historique.dart';

class HomeModel {
  late double balance;
  late String username;
  late String symbol;
  late List<Historique> historiques;

  HomeModel(
    {required this.balance,
    required this.username,
    required this.symbol,
    required this.historiques,}
  );

  HomeModel copyWith({
    double? balance,
    String? username,
    String? symbol,
    List<Historique>? historiques,
  }) {
    return HomeModel(
      balance: balance ?? this.balance,
      username: username ?? this.username,
      symbol: symbol ?? this.symbol,
      historiques: historiques ?? this.historiques,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
      'username': username,
      'symbol': symbol,
      'historiques': historiques.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      balance: double.parse(map['wallet']['balance'].toString()),
      username: map['profil']['username'] as String,
      symbol: map['wallet']['symbole'] as String,
      historiques: List<Historique>.from(
        (map['historique'] as List<dynamic>).map<Historique>(
          (x) => Historique.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeModel(balance: $balance, username: $username, symbol: $symbol, historiques: $historiques)';
  }

  @override
  bool operator ==(covariant HomeModel other) {
    if (identical(this, other)) return true;

    return other.balance == balance &&
        other.username == username &&
        other.symbol == symbol &&
        listEquals(other.historiques, historiques);
  }

  @override
  int get hashCode {
    return balance.hashCode ^
        username.hashCode ^
        symbol.hashCode ^
        historiques.hashCode;
  }
}
