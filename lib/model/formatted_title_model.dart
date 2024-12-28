import 'package:fampay_assignment/model/formatted_text_model.dart';

class FormattedTitle {
  final String text;
  final String align;
  final List<FormattedText> entities;

  FormattedTitle({
    required this.text,
    required this.align,
    required this.entities,
  });

  factory FormattedTitle.fromJson(Map<String, dynamic> json) {
    var entitiesList = json['entities'] as List;
    List<FormattedText> entities = entitiesList.map((e) => FormattedText.fromJson(e)).toList();

    return FormattedTitle(
      text: json['text'] ?? '',
      align: json['align'] ?? '',
      entities: entities,
    );
  }
}
