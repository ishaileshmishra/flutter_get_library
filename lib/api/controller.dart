import 'package:flutter_news_app/api/service.dart';
import 'package:flutter_news_app/model/news.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articleNews = List<Article>.empty().obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<List<Article>?> fetchNews() async {
    isLoading(true);
    try {
      var news = await Service.fetchNews();
      if (news != null) {
        //if(news!.status == "ok"){} else handle error
        articleNews.value = news.articles;
        return articleNews;
      }
    } finally {
      isLoading(false);
    }
  }
}
