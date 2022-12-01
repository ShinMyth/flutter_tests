import 'package:tests/models/article.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsArticleScreenView extends StatefulWidget {
  const NewsArticleScreenView({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  State<NewsArticleScreenView> createState() => _NewsArticleScreenViewState();
}

class _NewsArticleScreenViewState extends State<NewsArticleScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Tests"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Text(
              widget.article.title,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 17.5.sp,
              ),
            ),
            Divider(
              height: 3.h,
              thickness: 1,
              color: Colors.black,
            ),
            Text(
              widget.article.content,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
