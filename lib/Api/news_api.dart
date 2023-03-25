import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_models.dart';

class NewsApi {
  Future<NewsModel> fetchNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=702a87ffa63e48ddb10955a07f513ad3'));
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      // print(responseData.toString());
      return NewsModel.fromJson(responseData);

      // return NewsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('error in api');
    }
  }
}
