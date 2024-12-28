import 'package:fampay_assignment/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        
        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error));
        }

        return ListView.builder(
          itemCount: controller.apiData.length,
          itemBuilder: (context, index) {
            final data = controller.apiData[index];
            return ListTile(
              title: Text(data.slug),
            );
          },
        );
      }),
    );
  }
}