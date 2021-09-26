import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/news.dart';
import 'package:flutter_news_app/ui/newsdetail/newsdetail.dart';
import 'package:get/get.dart';

class NewsFeedItem extends StatelessWidget {
  final Article articleIndex;

  NewsFeedItem(this.articleIndex);

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.parse(articleIndex.publishedAt.toString());

    Row newsPublisher(Article article) {
      return Row(
        children: [
          Text(
            article.source.name,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_horiz_outlined,
            color: Colors.grey.shade500,
          )
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0,
      ),
      child: ListTile(
        onTap: () => Get.to(NewsDetail(articleIndex)),
        leading: Image.network(
          articleIndex.urlToImage,
          fit: BoxFit.cover,
          width: 80,
          height: double.infinity,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            newsPublisher(articleIndex),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Text(
                articleIndex.title.toString(),
                maxLines: 2,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              articleIndex.author,
              maxLines: 1,
              softWrap: true,
              style: TextStyle(
                  //color: Colors.grey.shade500,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 8),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0${dt.month}-${dt.day}-${dt.year}',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 30),
                Text(
                  '5 min read',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 30),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
