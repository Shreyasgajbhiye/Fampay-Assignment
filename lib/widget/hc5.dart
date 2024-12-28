import 'package:fampay_assignment/model/card_model.dart';
import 'package:flutter/material.dart';

class HC5Widget extends StatelessWidget {
  final HcGroup group;

  const HC5Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          group.isScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: group.cards.length,
      itemBuilder: (context, index) {
        final card = group.cards[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: EdgeInsets.all(16),
            child: AspectRatio(
              aspectRatio: card.bgImage?.aspectRatio ?? 1.0,
              child: Image.network(
                card.bgImage!.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
