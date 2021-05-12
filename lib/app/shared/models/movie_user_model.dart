class MovieUserModel {
  int id;
  int userId;
  DateTime date;
  int favorite;
  int watched;
  int note;

  MovieUserModel({
    this.id,
    this.userId,
    this.date,
    this.favorite,
    this.watched,
    this.note,
  });

  factory MovieUserModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return MovieUserModel(
        id: json["fk_filme_id"],
        userId: json["fk_usuario_id"],
        date: DateTime.parse(json["data"]),
        favorite: json["favorito"],
        watched: json["assistido"],
        note: json["nota"],
      );
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "userId": this.userId,
      "date": this.date,
      "favorite": this.favorite,
      "watched": this.watched,
      "note": this.note,
    };
  }
}
