import 'package:news_app/data/api_data.dart';
import 'package:news_app/data/network_services_api.dart';
import 'package:news_app/models/news.dart';

class Response {
  static Future<News> getNews() async {
    Map<String, dynamic> response = await NetworkServicesApi.getApi(mainUrl);
    return News.fromJson(response);
  }
}
