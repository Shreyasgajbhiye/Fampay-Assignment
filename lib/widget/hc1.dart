import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/widget/formatted_text_widget.dart';
import 'package:flutter/material.dart';

class HC1Widget extends StatelessWidget {
  final HcGroup group;

  const HC1Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: group.height?.toDouble() ?? 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: group.isScrollable
            ? ScrollPhysics()
            : NeverScrollableScrollPhysics(),
        itemCount: group.cards.length,
        itemBuilder: (context, index) {
          final card = group.cards[index];
          return Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Color(int.parse(
              //     card.bgColor?.replaceAll('#', '0xFF') ?? '0xFFFFFFFF')),
              color: hexToColor(card.bgColor.toString()),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (card.icon != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(card.icon!.imageUrl),
                  ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormattedTextWidget(formatted: card.formattedTitle),
                    if (card.formattedDescription != null)
                      FormattedTextWidget(
                          formatted: card.formattedDescription!),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
