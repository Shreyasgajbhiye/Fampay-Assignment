import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:flutter/material.dart';

Widget buildCard(dynamic card, double? width) {
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
                  Text((card.formattedTitle == null) ? "" :card.formattedTitle.entities.first.text,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14
                  ),
                  ),
                  Text((card.formattedDescription == null) ? "" : card.formattedDescription.entities.first.text,
                  maxLines: 1,
                  
                  style: const TextStyle(
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