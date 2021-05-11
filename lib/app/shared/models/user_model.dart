class UserModel {
  int id;
  String email, name, password, token;
  int totalTime;
  double iat;
  double exp;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.totalTime,
    this.exp,
    this.iat,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return UserModel(
        id: json["id"],
        name: json["nome"],
        email: json["email"],
        password: json["password"],
        exp: json["exp"],
        iat: json["iat"],
        totalTime: json["tempoTotal"],
        token: json["token"],
      );
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "exp": this.exp,
      "iat": this.iat,
      "totalTime": this.totalTime,
      "token": this.token,
    };
  }
}
