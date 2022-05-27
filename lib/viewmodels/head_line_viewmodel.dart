import 'package:flutter/material.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/models/model/news_model.dart';
import 'package:newstragram/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _repository;

  HeadLineViewModel({repository}): _repository = repository;

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> getHeadLines({required SearchType searchType}) async{
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();

    _articles = await _repository.getNews(searchType: SearchType.HEAD_LINE);
    print("Search type: $_searchType / articles: ${_articles[0].title}");
    _isLoading = false;
    notifyListeners();
  }
}
