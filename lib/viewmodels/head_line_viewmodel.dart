import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/models/model/news_model.dart';
import 'package:newstragram/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;
}
