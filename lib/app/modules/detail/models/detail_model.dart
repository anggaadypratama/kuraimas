class DetailModel {
  String? duration;
  int? episodes;
  String? status;
  String? synopsis;
  String? trailer;
  List<Genres>? genre;

  DetailModel.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    episodes = json['episodes'];
    status = json['status'];
    synopsis = json['synopsis'];
    trailer = json['trailer_url'];
    if (json['genres'] != null) {
      genre = <Genres>[];
      json['genres'].forEach((v) {
        genre?.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres {
  String? name;

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

// detail:
// - duration
// - episodes
// - status
// - synopsis
// - trailer_url
// - genres