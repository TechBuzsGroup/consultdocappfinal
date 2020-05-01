class User {
  String uid;
  String id;
  String name;
  String email;
  String username;
  String status;
  int state;
  String profilePhoto;
  String usercat;
  String firebaseToken;

  User({
    this.uid,
    this.id,
    this.usercat,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.profilePhoto,
    this.firebaseToken
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['id'] = user.uid;
    data['name'] = user.name;
    data['email'] = user.email;
    data['username'] = user.username;
    data["status"] = user.status;
    data["state"] = user.state;
    data["profile_photo"] = user.profilePhoto;
    data["firebaseToken"] = user.firebaseToken;
    return data;
  }

  // Named constructor
  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.id = mapData['id'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.username = mapData['username'];
    this.status = mapData['status'];
    this.state = mapData['state'];
    this.profilePhoto = mapData['profile_photo'];
    this.firebaseToken = mapData['firebaseToken'];
  }


  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['Display Name'],
        email = data['email'],
        usercat = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Display Name': name,
      'email': email,
      'userRole': usercat,
    };
  }

}
