import 'dart:developer';

import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/page/home_page.dart';
import 'package:fampay_assignment/widget/formatted_text_widget.dart';
import 'package:flutter/material.dart';

class HC3Widget extends StatelessWidget {
  final HcGroup group;

  const HC3Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          group.isScrollable ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: group.cards.length,
      itemBuilder: (context, index) {
        final card = group.cards[index];
        return GestureDetector(
          onLongPress: () => _showActionSheet(context),
          onTap: () {
            if (card.url != null) {
              
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: group.height! - 220.toDouble(),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: card.bgImage != null
                  ? DecorationImage(
                      image: NetworkImage(card.bgImage!.imageUrl),
                      fit: BoxFit.fill,
                    )
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: FormattedTextWidget(
                    formatted: card.formattedTitle,
                  ),
                ),
                if (card.cta != null && card.cta!.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        log(card.cta!.first.bgColor.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Color(int.parse(
                        //     card.cta!.first.bgColor.replaceAll('#', '0xFF'))),
                        backgroundColor:  hexToColor(card.cta!.first.bgColor.toString()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              card.cta!.first.isCircular ? 24 : 8),
                        ),
                      ),
                      child: Text(card.cta!.first.text,
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Remind Later'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Dismiss Now'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}