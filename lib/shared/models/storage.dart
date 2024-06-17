import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/models/user.dart';

class Storage {
  int? id;
  String? note;
  String? label;
  List<Password>? passwords;
  User? user;

  Storage({
    this.id,
    this.note,
    this.label,
    this.passwords,
    this.user,
  });

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json['id'],
      note: json['note'],
      label: json['label'],
      passwords: json['passwords'] != null
          ? List<Password>.from(
              json['passwords'].map((x) => Password.fromJson(x)))
          : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'label': label,
      'passwords': passwords?.map((x) => x.toJson()).toList(),
      'user': user?.toJson(),
    };
  }
}