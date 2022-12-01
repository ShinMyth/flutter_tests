import 'package:flutter_test/flutter_test.dart';
import 'package:tests/models/article.dart';
import 'package:tests/screens/news_screen/news_screen_service.dart';
import 'package:tests/services/news_service.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late MockNewsService mockNewsService;
  late NewsScreenService sut;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsScreenService(mockNewsService);
  });

  final articlesFromService = [
    Article(title: "Test 1", content: "Test 1 Content"),
    Article(title: "Test 2", content: "Test 2 Content"),
    Article(title: "Test 3", content: "Test 3 Content"),
  ];

  void callNewsServiceGetArticles() {
    when(() => mockNewsService.getArticles()).thenAnswer(
      (invocation) async => articlesFromService,
    );
  }

  test(
    "Test if NewsScreenService initial values are correct.",
    () {
      expect(sut.articles, []);
      expect(sut.isLoading, false);
    },
  );

  test(
    "Test if NewsService.getArticles() is called in NewsScreenService.getArticles().",
    () async {
      callNewsServiceGetArticles();
      await sut.getArticles();
      verify(() => mockNewsService.getArticles()).called(1);
    },
  );

  test(
    "Test if NewsScreenService.getArticles() has loading and if the result articles matches with NewsService articles.",
    () async {
      callNewsServiceGetArticles();
      final future = sut.getArticles();
      expect(sut.isLoading, true);
      await future;
      expect(sut.articles, articlesFromService);
      expect(sut.isLoading, false);
    },
  );
}
