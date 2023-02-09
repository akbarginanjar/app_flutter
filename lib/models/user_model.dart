class User {
  int? userid;
  String? username;
  String? pass;
  String? useremail;

  User({
    this.userid,
    this.username,
    this.pass,
    this.useremail,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: json['userid'] ?? 0,
      username: json['username'] ?? '',
      pass: json['pass'] ?? '',
      useremail: json['useremail'] ?? '',
    );
  }
}
