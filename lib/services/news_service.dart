import 'package:tests/models/article.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class NewsService {
  final List<Article> articles = List.generate(
    13,
    (index) => Article(
      title: lorem(paragraphs: 1, words: 10),
      content: lorem(paragraphs: 4, words: 175),
    ),
  );

  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    return articles;
  }
}
