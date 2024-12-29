
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/widget/hc1.dart';
import 'package:fampay_assignment/widget/hc3.dart';
import 'package:fampay_assignment/widget/hc5.dart';
import 'package:fampay_assignment/widget/hc6.dart';
import 'package:fampay_assignment/widget/hc9.dart';
import 'package:flutter/material.dart';
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
