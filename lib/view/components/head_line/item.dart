import 'package:flutter/material.dart';
import 'package:newstragram/models/model/news_model.dart';
import 'package:newstragram/view/components/page_transformer.dart';

class HeadLineItem extends StatelessWidget {

  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleCLicked;

  HeadLineItem({
    required this.article,
    required this.pageVisibility,
    required this.onArticleCLicked
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
