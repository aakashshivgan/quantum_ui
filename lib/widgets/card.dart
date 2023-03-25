import 'package:flutter/material.dart';
import 'package:quantum_ui/model/news_models.dart';

class NewsCard extends StatelessWidget {
  final Articles newsModel;
  final int index;
  const NewsCard({
    required this.newsModel,
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String imgUrl = newsModel.urlToImage.toString();
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.24),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Row(
          children: [
            Text(
              newsModel.publishedAt.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(newsModel.source!.name.toString(),
                style: const TextStyle(color: Colors.grey, fontSize: 15))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    newsModel.title.toString(),
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    newsModel.description.toString(),
                    style: const TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            newsModel.urlToImage != null
                ? SizedBox(
                    height: 100,
                    width: 80,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.contain,
                    ),
                  )
                : const FlutterLogo()
          ],
        )
      ]),
    );
  }
}
