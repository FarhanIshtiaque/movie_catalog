class MovieCastModel {
  int id;
  List<Cast> cast;
  List<Cast> crew;

  MovieCastModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );
}

class Cast {
  int id;
  String name;
  String originalName;
  double popularity;
  String? profilePath;

  Cast({
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );
}
