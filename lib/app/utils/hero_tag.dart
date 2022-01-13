class HeroTag {
  static String image(String urlImage) => urlImage;

  static String title(Map<String, dynamic> data) =>
      data['imgUrl'] + data['title'];

  static String score(Map<String, dynamic>? data) =>
      data!['score'].toString() + data['imgUrl'];
}
