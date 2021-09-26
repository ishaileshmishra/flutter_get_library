import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_app/api/controller.dart';
import 'package:flutter_news_app/ui/newsfeed/_item.dart';
import 'package:get/get.dart';

class NewsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ));
    var controller = Get.put(NewsController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        leading: Icon(
          CupertinoIcons.text_justifyleft,
          color: Colors.black,
        ),
        title: appTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tour daily read',
                    style: TextStyle(
                        //color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    CupertinoIcons.bookmark,
                    size: 20,
                  )
                ],
              ),
            ),
            Expanded(child: Obx(() {
              if (controller.isLoading.value)
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.deepOrange.shade500,
                  strokeWidth: 2,
                ));
              else
                return ListView.builder(
                    //padding: EdgeInsets.zero, // remove top padding from the list
                    itemCount: controller.articleNews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsFeedItem(controller.articleNews[index]);
                    });
            }))
          ],
        ),
      ),
    );
  }

  Column appTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Global Headlines',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          'International news publishers',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Image newsThumbnail() {
    return Image.asset(
      'assets/image/menu.png',
      height: 30,
      width: 30,
      color: Colors.grey.shade700,
    );
  }
}
