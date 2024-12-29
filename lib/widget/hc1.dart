import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/widget/formatted_text_widget.dart';
import 'package:flutter/material.dart';

class HC1Widget extends StatelessWidget {
  final HcGroup group;

  const HC1Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (group.cards.length == 1) {
      return Container(
        margin: const EdgeInsets.all(16),
        height: group.height?.toDouble() ?? 64,
        child: _buildCard(group.cards[0], MediaQuery.of(context).size.width - 32), 
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      height: group.height?.toDouble() ?? 64,
      child: !group.isScrollable
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: group.cards.length,
              itemBuilder: (context, index) {
                return _buildCard(group.cards[index], null);
              },
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: group.cards.map((card) {
                    double cardWidth = (constraints.maxWidth - 
                        (9.0 * (group.cards.length ))) / group.cards.length;
                    return _buildCard(card, cardWidth);
                  }).toList(),
                );
              },
            ),
    );
  }

  Widget _buildCard(dynamic card, double? width) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      width: width,
      decoration: BoxDecoration(
        color: hexToColor(card.bgColor.toString()),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IntrinsicWidth( 
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          children: [
            if (card.icon != null)
              CircleAvatar(
                backgroundImage: NetworkImage(card.icon!.imageUrl),
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // FormattedTextWidget(formatted: card.formattedTitle),
                  // if (card.formattedDescription != null)
                  //   FormattedTextWidget(formatted: card.formattedDescription!),
                  // if (card.formattedDescription != null)
                  //   FormattedTextWidget(formatted: card.formattedDescription!),
                  
                  Text((card.formattedTitle == null) ? "" :card.formattedTitle.entities.first.text,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14
                  ),
                  ),
                  Text((card.formattedDescription == null) ? "" : card.formattedDescription.entities.first.text,
                  maxLines: 1,
                  
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}