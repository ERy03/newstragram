import 'package:flutter/material.dart';
import 'package:newstragram/data/search_type.dart';
import 'package:newstragram/view/components/page_transformer.dart';
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
        body: Consumer<HeadLineViewModel>(
          builder: (context, model, child) {
            return PageTransformer(
              pageViewBuilder: (context, pageVisibilityResolver){
              return PageView.builder(
                controller: PageController(),
                  itemCount: model.articles.length,
                  itemBuilder: (context, index) {
                    final article = model.articles[index];
                    final pageVisibility = pageVisibilityResolver.resolvePageVisibility(index);
                    final visibleFraction = pageVisibility.visibleFraction;
                    return Opacity(
                      opacity: visibleFraction,
                      child: Container(
                        color: Colors.blueAccent,
                        child: Center(
                          child: Column(
                            children: [
                              Text(article.title ?? ""),
                              Text(article.description ?? ""),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: ()=> onRefresh(context),
        ),
      ),
    );
  }

  //TODO
  onRefresh(BuildContext context) async{
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getHeadLines(searchType: SearchType.HEAD_LINE);
  }
}
