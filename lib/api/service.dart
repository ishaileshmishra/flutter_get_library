// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'package:flutter_news_app/model/news.dart';

class Service {
  static var client = http.Client();

  static final String newsUrl = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5c66f9ee9171404f9adb600b107c71e0';

  static Future<News?> fetchNews() async {
    var response = await client.get(newsUrl);
    if (response.statusCode == 200) {
      var str = response.body;
      return newsFromJson(str);
    } else {
      return null;
    }
  }
}
