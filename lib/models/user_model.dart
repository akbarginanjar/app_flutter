class User {
  int? userid;
  String? usernama;
  String? password;
  String? useremail;
  String? token;
  String? tokenExpireDate;

  User(
      {this.userid,
      this.usernama,
      this.password,
      this.useremail,
      this.token,
      this.tokenExpireDate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userid'],
      usernama: json['usernama'] ?? '',
      password: json['password'] ?? '',
      useremail: json['useremail'] ?? '',
      token: json['token'] ?? '',
      tokenExpireDate: json['token_expire_date'] ?? '',
    );
  }
}
