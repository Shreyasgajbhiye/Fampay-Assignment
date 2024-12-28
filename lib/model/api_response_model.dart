import 'package:fampay_assignment/model/hc_groud_model.dart';

class ApiResponse {
  final List<HcGroup> hcGroups;

  ApiResponse({
    required this.hcGroups,
  });

  factory ApiResponse.fromJson(List<dynamic> json) {
    List<HcGroup> hcGroups = json.map((e) => HcGroup.fromJson(e)).toList();
    return ApiResponse(hcGroups: hcGroups);
  }
}