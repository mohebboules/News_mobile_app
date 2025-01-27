import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryView(
                  category: category.categoryName,
                )));
      },
      child: Container(
        height: 85,
        width: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(category.imageAssetUrl),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Stack(
          children: <Widget>[
            Text(
              category.categoryName,
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.black,
              ),
            ),
            Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
