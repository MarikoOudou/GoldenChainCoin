// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthResponseModel {
  String status;
  String description;
  int code;
  AuthResponseModel({
    required this.status,
    required this.description,
    required this.code,
  });

  AuthResponseModel copyWith({
    String? status,
    String? description,
    int? code,
  }) {
    return AuthResponseModel(
      status: status ?? this.status,
      description: description ?? this.description,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'description': description,
      'code': code,
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      status: map['status'] as String,
      description: map['description'] as String,
      code: map['code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) => AuthResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthResponseModel(status: $status, description: $description, code: $code)';

  @override
  bool operator ==(covariant AuthResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.description == description &&
      other.code == code;
  }

  @override
  int get hashCode => status.hashCode ^ description.hashCode ^ code.hashCode;
}
