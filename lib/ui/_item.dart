import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/news.dart';

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

    return Card(
      elevation: 1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade800,
          maxRadius: 25,
          child: Image.network(
            articleIndex.urlToImage,
            height: 20,
            width: 20,
            color: Colors.white,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            newsPublisher(articleIndex),
            Text(
              articleIndex.title.toString(),
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0${dt.month}-${dt.day}-${dt.year}',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  '5 min read',
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow.shade500,
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
