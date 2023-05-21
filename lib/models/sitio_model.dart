// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sitio {
  final int id;
  final String name;
  final String ip;
  final bool status;

  Sitio(
    this.id,
    this.name,
    this.ip,
    this.status,
  );

  Sitio copyWith({
    int? id,
    String? name,
    String? ip,
    bool? status,
  }) {
    return Sitio(
      id ?? this.id,
      name ?? this.name,
      ip ?? this.ip,
      status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'ip': ip,
      'status': status,
    };
  }

  factory Sitio.fromMap(Map<String, dynamic> map) {
    return Sitio(
      map['id'] as int,
      map['name'] as String,
      map['ip'] as String,
      map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sitio.fromJson(String source) =>
      Sitio.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sitio(id: $id, name: $name, ip: $ip, status: $status)';
  }

  @override
  bool operator ==(covariant Sitio other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.ip == ip &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ ip.hashCode ^ status.hashCode;
  }
}
