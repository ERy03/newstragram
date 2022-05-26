import 'package:flutter/material.dart';
import 'package:newstragram/models/model/news_model.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  final ValueChanged onArticleCLicked;

  const ArticleTile({required this.article, required this.onArticleCLicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleCLicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(article.title ?? ""),
                    Text(article.publishDate ?? ""),
                    Text(article.description ?? ""),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
