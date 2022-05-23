import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';

class NewsListViewModel extends ChangeNotifier {
  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;
}
