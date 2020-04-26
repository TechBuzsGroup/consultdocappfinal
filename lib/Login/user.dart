class User {
  final String id;
  final String displayname;
  final String email;
  final String userRole;

  User({this.id, this.displayname, this.email, this.userRole});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        displayname = data['Display Name'],
        email = data['email'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Display Name': displayname,
      'email': email,
      'userRole': userRole,
    };
  }
}