// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'package:flutter_news_app/model/news.dart';

class Service {
  static var client = http.Client();

  static final String newsUrl = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=your_own_api_key';

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
