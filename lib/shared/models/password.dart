class Password {
  int? id;
  String? label;
  String? password;
  int? storageId; // Optionally include storageId if needed

  Password({
    this.id,
    this.label,
    this.password,
    this.storageId,
  });

  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
      id: json['id'],
      label: json['label'],
      password: json['password'],
      storageId: json['storageId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'password': password,
      'storageId': storageId,
    };
  }
}