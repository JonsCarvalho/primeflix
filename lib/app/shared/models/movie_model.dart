class MovieModel {
  int id;
  String name, image, banner;
  int duration;
  int year;
  int note;

  MovieModel({
    this.id,
    this.name,
    this.image,
    this.banner,
    this.duration,
    this.note,
    this.year,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return MovieModel(
        id: json["id"],
        name: json["nome"],
        banner: json["banner"],
        image: json["imagem"],
        duration: json["duracao"],
        note: json["nota"],
        year: json["ano"],
      );
    } else {
      return null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "banner": this.banner,
      "image": this.image,
      "duration": this.duration,
      "note": this.note,
      "year": this.year,
    };
  }
}
