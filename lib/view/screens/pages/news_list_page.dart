import 'package:flutter/material.dart';
import 'package:newstragram/data/category_info.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/view/components/article_tile.dart';
import 'package:newstragram/view/components/category_chips.dart';
import 'package:newstragram/view/components/search_bar.dart';
import 'package:newstragram/view/screens/web_page_screen.dart';
import 'package:newstragram/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NewsListViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty){
      Future(() => viewModel.getNews(searchType: SearchType.CATEGORY, category: categories[0]));
    }
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

              CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category),
              ),

              Expanded(
                child: Consumer<NewsListViewModel>(
                  builder: (context, model, child) {
                    return model.isLoading
                      ? Center(child: CircularProgressIndicator(),)
                      : ListView.builder(
                        itemCount: model.articles.length,
                        itemBuilder: (context, int position) =>
                          ArticleTile(
                            article: model.articles[position],
                            onArticleCLicked: (article) => _openArticleWebPage(article, context),
                          )
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> onRefresh(BuildContext context) async{
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print("Refreshing page");
  }

  Future<void> getKeywordNews(BuildContext context, keyword) async{
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyword: keyword,
      category: categories[0],
    );
    print("${keyword}");
  }

  Future<void> getCategoryNews(BuildContext context, Category category) async{
    print("${category.nameJp}");
    final viewModel = context.read<NewsListViewModel>();
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }

  _openArticleWebPage(article, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsWebPageScreen(
          article: article,
        )
      )
    );
  }
}
