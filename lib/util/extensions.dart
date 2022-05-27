import 'package:newstragram/models/db/database.dart';
import 'package:newstragram/models/model/news_model.dart';

extension ConvertToArticleRecord on List<Article> {
  List<ArticleRecord> toArticleRecords(List<Article> articles) {
    List<ArticleRecord> articleRecords = [];
    articles.forEach((article) {
      articleRecords.add(
        ArticleRecord(
          title: article.title ?? "",
          description: article.description ?? "",
          url: article.url ?? "",
          urlToImage: article.urlToImage ?? "",
          publishDate: article.publishDate ?? "",
          content: article.content ?? ""
        )
      );
    });
    return articleRecords;
  }
}

extension ConvertToArticle on List<ArticleRecord> {
  List<Article> toArticles(List<ArticleRecord> articleRecords) {
    var articles = <Article>[];
    articleRecords.forEach((articleRecord) {
      articles.add(Article(
          title: articleRecord.title,
          description: articleRecord.description,
          url: articleRecord.url,
          urlToImage: articleRecord.urlToImage,
          publishDate: articleRecord.publishDate,
          content: articleRecord.content,
        )
      );
    });
    return articles;
  }
}