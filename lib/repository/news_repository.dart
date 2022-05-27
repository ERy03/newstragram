import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/main.dart';
import 'package:newstragram/models/db/database.dart';
import 'package:newstragram/models/model/news_model.dart';
import 'package:newstragram/util/extensions.dart';


class NewsRepository {

  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "c27b14cba77046f984200c8c0e486afb";

  Future<List<Article>> getNews({
    required SearchType searchType,
    String? keyword,
    Category? category
  }) async{

    List<Article> results = [];

    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(BASE_URL + "&q=$keyword&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }

    if (response.statusCode == 200) {
      final responseBody = response.body;
      // results = News.fromJson(jsonDecode(responseBody)).articles;
      results = await insertAndReadNewsFromDB(jsonDecode(responseBody));
    } else {
      throw Exception("falied to load news");
    }
    return results;
  }

  Future<List<Article>> insertAndReadNewsFromDB(responseBody) async{
    final dao = myDatabase.newsDao;
    final articles = News.fromJson(responseBody).articles;

    final articleRecords = await dao.insertAndReadNewsFromDB(articles.toArticleRecords(articles));

    return articleRecords.toArticles(articleRecords);
  }
}
