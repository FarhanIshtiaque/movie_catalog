class MovieData {
  late int id;
  late String title;
  late String url;


  MovieData(
      {required this.id,
        required this.title,
        required this.url,
});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
    };
  }


  MovieData.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    url = map['url'];

  }

}