class CharactersModel {
  List? character;

  CharactersModel({this.character});

  CharactersModel.fromJson(Map<String, dynamic> json) {
    if (json['characters'] != null) {
      character = <ListCharacters>[];
      json['characters'].forEach((v) {
        character?.add(ListCharacters.fromJson(v));
      });
    }
  }
}

class ListCharacters {
  String? name;
  String? imgUrl;
  List? va;

  ListCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    va = json['voice_actors'];
    imgUrl = json['image_url'];
  }
}
