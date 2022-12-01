import 'package:tests/screens/news_article_screen/news_article_screen_view.dart';
import 'package:tests/screens/news_screen/news_screen_service.dart';
import 'package:tests/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsScreenView extends StatefulWidget {
  const NewsScreenView({Key? key}) : super(key: key);

  @override
  State<NewsScreenView> createState() => _NewsScreenViewState();
}

class _NewsScreenViewState extends State<NewsScreenView> {
  late NewsScreenService newsScreenService;

  @override
  void initState() {
    newsScreenService = NewsScreenService(NewsService());

    getArticles();
    super.initState();
  }

  getArticles() async {
    await newsScreenService.getArticles();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Tests"),
        centerTitle: true,
      ),
      body: newsScreenService.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsScreenService.articles.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.5.w),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsArticleScreenView(
                              article: newsScreenService.articles[index]),
                        ),
                      );
                    },
                    leading: const Icon(Icons.article),
                    title: Text(
                      newsScreenService.articles[index].title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16.5.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
