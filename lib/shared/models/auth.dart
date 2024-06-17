class Auth {

  String? accessToken;
  String? refreshToken;

  Auth({this.accessToken, this.refreshToken});

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      accessToken: json['accessToken'], 
      refreshToken: json['refreshToken'],
    );
  }

}