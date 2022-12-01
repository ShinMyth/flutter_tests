import 'package:tests/models/article.dart';
import 'package:tests/services/news_service.dart';

class NewsScreenService {
  NewsScreenService(this.newsService);

  final NewsService newsService;

  List<Article> articles = <Article>[];
  bool isLoading = false;

  Future<void> getArticles() async {
    isLoading = true;

    articles = await newsService.getArticles();

    isLoading = false;
  }
}
