import 'package:flutter/material.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/models/model/news_model.dart';
import 'package:newstragram/view/components/head_line_item.dart';
import 'package:newstragram/view/components/page_transformer.dart';
import 'package:newstragram/view/screens/web_page_screen.dart';
import 'package:newstragram/viewmodels/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeadLinePage extends StatelessWidget {
  const HeadLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = context.read<HeadLineViewModel>();

    if(!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getHeadLines(searchType: SearchType.HEAD_LINE));
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HeadLineViewModel>(
            builder: (context, model, child) {
              if (model.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return PageTransformer(
                  pageViewBuilder: (context, pageVisibilityResolver) {
                    return PageView.builder(
                      controller: PageController(viewportFraction: 0.85),
                      itemCount: model.articles.length,
                      itemBuilder: (context, index) {
                        final article = model.articles[index];
                        final pageVisibility =
                            pageVisibilityResolver.resolvePageVisibility(index);
                        final visibleFraction = pageVisibility.visibleFraction;
                        return HeadLineItem(
                          article: model.articles[index],
                          pageVisibility: pageVisibility,
                          onArticleCLicked: (article) =>
                              _openArticleWebPage(context, article),
                        );
                      },
                    );
                  },
                );
              }

            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: ()=> onRefresh(context),
        ),
      ),
    );
  }


  onRefresh(BuildContext context) async{
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }

  _openArticleWebPage(BuildContext context, Article article) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewsWebPageScreen(
                  article: article,
                )
      )
    );
  }
}
