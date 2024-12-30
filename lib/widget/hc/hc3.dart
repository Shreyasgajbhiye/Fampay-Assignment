import 'package:fampay_assignment/model/hc_group_model.dart';
import 'package:fampay_assignment/static/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fampay_assignment/controller/hc3_controller.dart';
import 'package:fampay_assignment/core/convert_hex.dart';
import 'package:fampay_assignment/widget/formatted_text_widget.dart';

class HC3Widget extends StatefulWidget {
  final HcGroup group;

  const HC3Widget({Key? key, required this.group}) : super(key: key);

  @override
  _HC3WidgetState createState() => _HC3WidgetState();
}

class _HC3WidgetState extends State<HC3Widget> {
  bool isExpanded = false;
  late final HC3 controller;
  String get cardId => '${widget.group.cards.first.id}';

  @override
  void initState() {
    super.initState();
    controller = Get.put(HC3());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mq = MediaQuery.of(context).size;
    final normalWidth = screenWidth - 32;
    final shrinkWidth = screenWidth * 0.5;

    return Obx(() {
      if (controller.isCardHidden(cardId)) {
        return const SizedBox.shrink();
      }

      return GestureDetector(
        onLongPress: () {
          setState(() {
            isExpanded = true;
          });
        },
        onTap: () {
          if (isExpanded) {
            setState(() {
              isExpanded = false;
            });
          }
        },
        child: Stack(
          children: [
            Positioned.fill(child: buildUnderlyingCOntainer(context)),
            Container(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 380),
                height: widget.group.height! - 150.toDouble(),
                margin: EdgeInsets.all(16),
                width: isExpanded ? shrinkWidth : normalWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  image: widget.group.cards.first.bgImage != null
                      ? DecorationImage(
                          image: NetworkImage(
                              widget.group.cards.first.bgImage!.imageUrl),
                          fit: BoxFit.fill,
                        )
                      : null,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
                  child: buildUpperContainer(normalWidth),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buildUnderlyingCOntainer(BuildContext mq) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = false;
        });
      },
      onLongPress: () {
        setState(() {
          isExpanded = true;
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
              GestureDetector(
                onTap: () {
                  controller.hideCard(cardId);
                },
                child: Container(
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
                      Image.asset(AppAssets.cancel),
                      SizedBox(height: mq.height * 0.005),
                      const Text(
                        'Remind later',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.09,
              ),
              GestureDetector(
                onTap: () {
                  controller.hideCard(cardId);
                },
                child: Container(
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
                      Image.asset(AppAssets.bell),
                      SizedBox(height: mq.height * 0.005),
                      const Text(
                        'Dismiss now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget buildUpperContainer(double normalWidth) {
    return ClipRRect(
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
                      setState(() {
                        isExpanded = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: hexToColor(
                        widget.group.cards.first.cta!.first.bgColor.toString(),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          widget.group.cards.first.cta!.first.isCircular
                              ? 24
                              : 8,
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
    );
  }
}
