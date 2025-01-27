import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/widgets/app_bar_text.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          }),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              category: category,
            )
          ],
        ),
      ),
    );
  }
}
