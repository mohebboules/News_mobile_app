import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_key_holder.dart';

class NewsService {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getNews({required String category}) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category";
    try {
      Response response = await dio.get(url);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        if (articleModel.title != "[Removed]" && articleModel.title != null) {
          articlesList.add(articleModel);
        }
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
