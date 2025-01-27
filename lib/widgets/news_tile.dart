import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final String url = articleModel.url ?? "";
        if (url.isNotEmpty) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WebViewScreen(url: url)));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Url Not available")));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              articleModel.image ??
                  "https://t3.ftcdn.net/jpg/03/35/13/14/240_F_335131435_DrHIQjlOKlu3GCXtpFkIG1v0cGgM9vJC.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title ?? "Title not found",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subtitle ?? "Subtitle not found",
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
