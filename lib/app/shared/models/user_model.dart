class UserModel {
  int id;
  String email, name, password;
  int totalTime;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.totalTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return UserModel(
        id: json["id"],
        name: json["nome"],
        email: json["email"],
        password: json["password"],
        totalTime: json["tempoTotal"],
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
      "totalTime": this.totalTime,
    };
  }
}
