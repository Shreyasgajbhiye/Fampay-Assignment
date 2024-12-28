import 'dart:developer';

import 'package:fampay_assignment/controller/card_controller.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/widget/HC1.dart';
import 'package:fampay_assignment/widget/HC3.dart';
import 'package:fampay_assignment/widget/hc5.dart';
import 'package:fampay_assignment/widget/hc6.dart';
import 'package:fampay_assignment/widget/hc9.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: Obx(() {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.error.isNotEmpty) {
            return Center(child: Text(controller.error));
          }

          return ListView.builder(
            itemCount: controller.apiData.first.hcGroups.length,
            itemBuilder: (context, index) {
              final group = controller.apiData.first.hcGroups[index];
              return HcGroupWidget(group: group);
            },
          );
        }),
      ),
    );
  }
}

class HcGroupWidget extends StatelessWidget {
  final HcGroup group;

  const HcGroupWidget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (group.designType) {
      case 'HC3':
        return HC3Widget(group: group);
      case 'HC6':
        return HC6Widget(group: group);
      case 'HC5':
        return HC5Widget(group: group);
      case 'HC9':
        return HC9Widget(group: group);
      case 'HC1':
        return HC1Widget(group: group);
      default:
        return SizedBox.shrink();
    }
  }
}






