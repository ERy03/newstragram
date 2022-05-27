import 'package:flutter/material.dart';
import 'package:newstragram/models/db/dao.dart';
import 'package:newstragram/models/db/database.dart';
import 'package:newstragram/repository/news_repository.dart';
import 'package:newstragram/viewmodels/head_line_viewmodel.dart';
import 'package:newstragram/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
    )
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyDatabase, NewsDao>(
    update: (_, db, dao) => NewsDao(db),
  ),
  ProxyProvider<NewsDao, NewsRepository>(
    update: (_, dao, repository) => NewsRepository(dao: dao),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HeadLineViewModel>(
    create: (context) => HeadLineViewModel(
      repository: context.read<NewsRepository>(),
    ),
  ),
  ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(
      repository: context.read<NewsRepository>(),
    ),
  ),
];
