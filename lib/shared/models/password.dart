import 'package:client_flutter/shared/models/storage.dart';

class Password {
  int? id;
  String? tag;
  String? title;
  Storage? storage; // Optionally include storageId if needed

  Password({
    this.id,
    this.tag,
    this.title,
    this.storage,
  });

  factory Password.parse(Map<String, dynamic> json) {
    return Password(
      id: json['id'],
      tag: json['tag'],
      title: json['title'],
      storage: Storage.parse(json['storage']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tag': tag,
      'title': title,
      'storage': storage,
    };
  }
}