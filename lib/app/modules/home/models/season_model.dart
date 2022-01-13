class SeasonModel {
  List<Anime>? anime;

  SeasonModel({this.anime});

  SeasonModel.fromJson(Map<String, dynamic> json) {
    if (json['anime'] != null) {
      anime = <Anime>[];
      json['anime'].forEach((v) {
        anime?.add(Anime.fromJson(v));
      });
    }
  }
}

class Anime {
  int? malId;
  String? title;
  String? imgUrl;
  dynamic? score;

  Anime({this.malId, this.title, this.imgUrl, this.score});

  Anime.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    title = json['title'];
    imgUrl = json['image_url'];
    score = json['score'];
  }

  Map<String, dynamic> toMap() => ({
        'malId': malId,
        'title': title,
        'imgUrl': imgUrl,
        'score': score,
      });
}


// season: 
// - title
// - score
// - mal_id
// - image_url
