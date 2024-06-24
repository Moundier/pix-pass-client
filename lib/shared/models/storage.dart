import 'package:client_flutter/shared/models/password.dart';
import 'package:client_flutter/shared/models/user.dart';

class Storage {
  int? id;
  String? tag;
  String? title;
  List<Password>? passwords;
  User? user;

  Storage({
    this.id,
    this.tag,
    this.title,
    this.passwords,
    this.user,
  });

  factory Storage.parse(Map<String, dynamic> json) {
    return Storage(
      id: json['id'],
      tag: json['tag'],
      title: json['title'],
      passwords: json['passwords'] != null
          ? List<Password>.from(json['passwords'].map((x) => Password.parse(x)))
          : null,
      user: json['user'] != null ? User.parse(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag': tag,
      'title': title,
      'passwords': passwords?.map((x) => x.toJson()).toList(),
      'user': user?.toJson(),
    };
  }

  @override
  String toString() {
    return "Storage{id: $id, tag: $tag, title: $title, passwords: $passwords, user: $user}";
  }
}