import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/models/model/news_model.dart';


class NewsRepository {

  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=us";
  static const API_KEY = "c27b14cba77046f984200c8c0e486afb";

  Future<Article> getNews({required SearchType searchType, String? keyword, Category? category}) async{

  }
}
