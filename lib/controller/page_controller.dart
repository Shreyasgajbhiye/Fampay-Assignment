import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardController extends GetxController {
  var apiData = [].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    final String url = 'https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        apiData.value = json.decode(response.body);
        print("Data: ${apiData}");
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred while fetching data: $e");
    }
  }

  
}
