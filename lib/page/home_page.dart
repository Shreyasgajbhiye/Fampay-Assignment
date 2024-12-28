import 'package:fampay_assignment/controller/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final CardController pageController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data"),
      ),
      body: Obx(() {
        if (pageController.apiData.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: pageController.apiData.length,
          itemBuilder: (context, index) {
            final item = pageController.apiData[index];
            return ListTile(
              title: Text(item['title'] ?? "ABC"),
              subtitle: Text(item['body'] ?? "ABC"),
            );
          },
        );
      }),
    );
  }
}
