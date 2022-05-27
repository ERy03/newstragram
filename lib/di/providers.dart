import 'package:flutter/material.dart';
import 'package:newstragram/models/db/dao.dart';
import 'package:newstragram/models/db/database.dart';
import 'package:newstragram/repository/news_repository.dart';
import 'package:provider/provider.dart';

List globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List independentModels = [
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
    )
];

List dependentModels = [
  ProxyProvider<MyDatabase, NewsDao>(
    update: (_, db, dao) => NewsDao(db),
  ),
  ProxyProvider<NewsDao, NewsRepository>(
    update: (_, dao, repository) => NewsRepository(dao: dao),
  ),
];
