// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthModel {

  String identifiant;
  String password;
  AuthModel({
    required this.identifiant,
    required this.password,
  });
  

  AuthModel copyWith({
    String? identifiant,
    String? password,
  }) {
    return AuthModel(
      identifiant: identifiant ?? this.identifiant,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifiant': identifiant,
      'password': password,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      identifiant: map['identifiant'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModel(identifiant: $identifiant, password: $password)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.identifiant == identifiant &&
      other.password == password;
  }

  @override
  int get hashCode => identifiant.hashCode ^ password.hashCode;
}
