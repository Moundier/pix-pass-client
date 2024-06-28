
class User {

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  DateTime? termsAcceptedDate;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.termsAcceptedDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      termsAcceptedDate: DateTime.parse(json['termsAcceptedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'termsAcceptedDate': termsAcceptedDate,
    };
  }

  @override
  String toString() {
    return 'User{\n'
      '  id: $id,'
      '  firstName: $firstName,'
      '  lastName: $lastName,'
      '  email: $email,'
      '  termsAcceptedDate: $termsAcceptedDate,'
    '}';
  }
  
}