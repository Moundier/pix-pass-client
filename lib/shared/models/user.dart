
class User {

  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String role;
  DateTime termsAcceptedDate;
  bool tutorialComplete;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
    required this.termsAcceptedDate,
    required this.tutorialComplete,
  });

  factory User.parse(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      role:  json['role'],
      termsAcceptedDate: DateTime.parse(json['termsAcceptedDate']),
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
      'termsAcceptedDate': termsAcceptedDate.toIso8601String(),
      'tutorialComplete': tutorialComplete,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, '
        'role: $role, termsAcceptedDate: $termsAcceptedDate, tutorialComplete: $tutorialComplete}';
  }

}

enum Role {
  user, 
  guest, 
  admin, 
  creator,
}