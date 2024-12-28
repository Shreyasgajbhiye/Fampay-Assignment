import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:flutter/material.dart';

class HC6Widget extends StatelessWidget {
  final HcGroup group;

  const HC6Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: group.height! + 25.toDouble() ?? 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: group.isScrollable
            ? ScrollPhysics()
            : NeverScrollableScrollPhysics(),
        itemCount: group.cards.length,
        itemBuilder: (context, index) {
          final card = group.cards[index];
          return Container(
            // margin: EdgeInsets.symmetric(horizontal: 8),
            // padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              // color: Color(int.parse(
              //     card.bgColor?.replaceAll('#', '0xFF') ?? '0xFFFFFFFF')),
              color: hexToColor(card.bgColor.toString()),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                if (card.icon != null)
                  Image.network(
                    card.icon!.imageUrl,
                    height: card.iconSize! + 8.toDouble() ?? 24,
                  ),
                SizedBox(width: 8),
                Text(
                  card.formattedTitle!.entities.first.text.toString(),
                  style: TextStyle(
                    color: Color(int.parse(card
                        .formattedTitle!.entities.first.color!
                        .replaceAll('#', '0xFF'))),
                  ),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          );
        },
      ),
    );
  }
}
