import 'package:fampay_assignment/model/card_detail_model.dart';

class HcGroup {
  final int id;
  final String name;
  final String designType;
  final List<CardDetails> cards;

  HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cards,
  });

  factory HcGroup.fromJson(Map<String, dynamic> json) {
    var cardsList = json['cards'] as List;
    List<CardDetails> cards = cardsList.map((e) => CardDetails.fromJson(e)).toList();

    return HcGroup(
      id: json['id'],
      name: json['name'],
      designType: json['design_type'],
      cards: cards,
    );
  }
}