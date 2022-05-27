import 'package:flutter/material.dart';
import 'package:newstragram/models/model/news_model.dart';

class NewsWebPageScreen extends StatelessWidget {

  final Article article;

  NewsWebPageScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ""),
          centerTitle: true,
        ),
        //TODO
        body: Container(),
      ),
    );
  }
}
