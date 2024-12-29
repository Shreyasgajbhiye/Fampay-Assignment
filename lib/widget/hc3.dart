import 'dart:developer';

import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:fampay_assignment/widget/formatted_text_widget.dart';
import 'package:flutter/material.dart';

class HC3Widget extends StatefulWidget {
  final HcGroup group;

  const HC3Widget({Key? key, required this.group}) : super(key: key);

  @override
  _HC3WidgetState createState() => _HC3WidgetState();
}

class _HC3WidgetState extends State<HC3Widget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mq = MediaQuery.of(context).size;
    final normalWidth = screenWidth - 32;
    final shrunkWidth = screenWidth * 0.5;

    return GestureDetector(
      onLongPress: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
      onTap: () {
        if (_isExpanded) {
          setState(() {
            _isExpanded = false;
          });
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = false;
                });
              },
              onLongPress: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
              child: Container(
                padding: EdgeInsets.only(left: mq.width * 0.1),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: mq.width * 0.25,
                          height: mq.height * 0.11,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: hexToColor('#F7F6F3'),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/cancel.png'),
                              SizedBox(height: mq.height * 0.005),
                              Text(
                                'Remind later',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: mq.height * 0.03),
                        Container(
                          alignment: Alignment.center,
                          width: mq.width * 0.25,
                          height: mq.height * 0.11,
                          decoration: BoxDecoration(
                            color: hexToColor('#F7F6F3'),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/bell.png'),
                              SizedBox(height: mq.height * 0.005),
                              Text(
                                'Dismiss now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 380),
              height: widget.group.height! - 220.toDouble(),
              margin: EdgeInsets.all(16),
              width: _isExpanded ? shrunkWidth : normalWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: widget.group.cards.first.bgImage != null
                    ? DecorationImage(
                        image: NetworkImage(widget.group.cards.first.bgImage!.imageUrl),
                        fit: BoxFit.fill,
                      )
                    : null,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = false;
                  });
                },
                onLongPress: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: OverflowBox(
                    maxWidth: normalWidth,
                    child: SizedBox(
                      width: normalWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: FormattedTextWidget(
                              formatted: widget.group.cards.first.formattedTitle,
                            ),
                          ),
                          if (widget.group.cards.first.cta != null &&
                              widget.group.cards.first.cta!.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: ElevatedButton(
                                onPressed: () {
                                  log(widget.group.cards.first.cta!.first.bgColor.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: hexToColor(
                                    widget.group.cards.first.cta!.first.bgColor.toString(),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      widget.group.cards.first.cta!.first.isCircular ? 24 : 8,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  widget.group.cards.first.cta!.first.text,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
