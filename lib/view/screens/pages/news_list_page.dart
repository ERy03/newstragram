import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/view/components/category_chips.dart';
import 'package:newstragram/view/components/search_bar.dart';
import 'package:newstragram/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "更新",
          onPressed: () => onRefresh(context),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              //TODO Category chip
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),
              //TODO Show Articles
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO
  onRefresh(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print("Refreshing page");
  }

  getKeywordNews(BuildContext context, keyword) {
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print("${keyword}");
  }

  //TODO
  getCategoryNews(BuildContext context, Category category) {
    print("${category.nameJp}");
    final viewModel = context.read<NewsListViewModel>();
    viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }
}
