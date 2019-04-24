class LoginPojo {
  final String username;
  final String email;
  final String password;

  LoginPojo({this.username, this.email, this.password});

  factory LoginPojo.fromJson(Map<String, dynamic> json) {
    return LoginPojo(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["email"] = email;
    map["password"] = password;
    return map;
  }
}