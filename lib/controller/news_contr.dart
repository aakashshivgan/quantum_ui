import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:get/get.dart';
import 'package:quantum_ui/model/news_models.dart';
import 'package:http/http.dart' as http;

import '../Api/news_api.dart';

class NewsController extends GetxController {
  var newsList = <Articles>[].obs;
  var isLoading = false.obs;
  final Rx<NewsModel> newsModel = Rx<NewsModel>(NewsModel());

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  NewsApi api = NewsApi();
  getNews() async {
    isLoading(true);
    newsModel.value = await api.fetchNews();
    if (newsModel.value.status == 'ok') {
      for (var i = 0; i < newsModel.value.articles!.length; i++) {
        newsList.add(newsModel.value.articles![i]);
        // print(newsList[i].urlToImage);
      }
    }

    isLoading(false);
  }
}
