import 'package:fampay_assignment/model/card_model.dart';
import 'package:flutter/material.dart';

class FormattedTextWidget extends StatelessWidget {
  final Formatted? formatted;

  const FormattedTextWidget({Key? key, this.formatted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formatted == null) return SizedBox.shrink();

    final text = formatted!.text;
    final entities = formatted!.entities;

    final parts = text.split(RegExp(r'\{\}'));
    List<InlineSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(text: parts[i]));
      }

      if (i < entities.length) {
        final entity = entities[i];
        spans.add(
          TextSpan(
            text: entity.text,
            style: TextStyle(
              // height: entity.,
              color: entity.color != null
                  ? Color(int.parse(entity.color!.replaceAll('#', '0xFF')))
                  : Colors.white,
              fontSize: entity.fontSize?.toDouble() ?? 19,
              fontStyle: entity.fontStyle == 'italic'
                  ? FontStyle.italic
                  : FontStyle.normal,

              fontFamily: entity.fontFamily,
            ),
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: spans,
      ),
      textAlign:
          formatted!.align == 'center' ? TextAlign.center : TextAlign.left,
    );
  }
}
