import 'package:fampay_assignment/model/formatted_text_model.dart';

class FormattedDescription {
  final String text;
  final String align;
  final List<FormattedText> entities;

  FormattedDescription({
    required this.text,
    required this.align,
    required this.entities,
  });

  factory FormattedDescription.fromJson(Map<String, dynamic> json) {
    var entitiesList = json['entities'] as List;
    List<FormattedText> entities = entitiesList.map((e) => FormattedText.fromJson(e)).toList();

    return FormattedDescription(
      text: json['text'] ?? '',
      align: json['align'] ?? '',
      entities: entities,
    );
  }
}