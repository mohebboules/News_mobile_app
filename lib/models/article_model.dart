class ArticleModel {
  ArticleModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.url});

  final String? image;
  final String? title;
  final String? subtitle;
  final String? url;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subtitle: json['description'],
      url: json['url'],
    );
  }
}
