class UnplashUser {
  String name;
  String username;

  UnplashUser(this.name , this.username);

  Map toJson() => {
    "name": name,
    "username": username
  };

  factory UnplashUser.fromJson(dynamic json) {
    return UnplashUser(
        json['name'] as String,
        json['username'] as String
    );
  }

}