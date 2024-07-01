
class User {

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? role;
  String? termsAcceptedDate;
  bool? tutorialComplete;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role,
    this.termsAcceptedDate,
    this.tutorialComplete,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      termsAcceptedDate: json['termsAcceptedDate'],
      tutorialComplete: json['tutorialComplete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role,
      'termsAcceptedDate': termsAcceptedDate,
      'tutorialComplete': tutorialComplete,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role, termsAcceptedDate: $termsAcceptedDate, tutorialComplete: $tutorialComplete}';
  }
}