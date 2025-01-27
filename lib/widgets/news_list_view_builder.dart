import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  Future<List<ArticleModel>>? future;
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data ?? [],
            );
          } else if (snapshot.hasError) {
            return const SliverFillRemaining(
              child: Center(
                child: Text("Oops their was an error"),
              ),
            );
          } else {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
