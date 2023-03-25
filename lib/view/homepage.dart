import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quantum_ui/controller/firebase_auth.dart';

import '../controller/news_contr.dart';
import '../widgets/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return GetX<NewsController>(
        init: NewsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              title: const TextField(
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    hintText: " Search in feed",
                    border: InputBorder.none),
              ),
            ),
            body: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.newsModel.value.articles!.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        index: index,
                        newsModel: controller.newsModel.value.articles![index],
                      );
                    },
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                AuthController.authInstance.signOut();
              },
              child: const Icon(Icons.logout),
            ),
          );
        });
  }
}
