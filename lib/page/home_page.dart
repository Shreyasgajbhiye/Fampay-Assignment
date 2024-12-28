// home_screen.dart
import 'dart:developer';

import 'package:fampay_assignment/controller/card_controller.dart';
import 'package:fampay_assignment/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ApiController controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refreshData(),
        child: Obx(() {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.error.isNotEmpty) {
            return Center(child: Text(controller.error));
          }

          return ListView.builder(
            itemCount: controller.apiData.first.hcGroups.length,
            itemBuilder: (context, index) {
              final group = controller.apiData.first.hcGroups[index];
              return HcGroupWidget(group: group);
            },
          );
        }),
      ),
    );
  }
}

class HcGroupWidget extends StatelessWidget {
  final HcGroup group;

  const HcGroupWidget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (group.designType) {
      case 'HC3':
        return HC3Widget(group: group);
      case 'HC6':
        return HC6Widget(group: group);
      case 'HC5':
        return HC5Widget(group: group);
      case 'HC9':
        return HC9Widget(group: group);
      case 'HC1':
        return HC1Widget(group: group);
      default:
        return SizedBox.shrink();
    }
  }
}

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
            height: group.height! - 220.toDouble() ?? 300,
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
                        backgroundColor: Color(int.parse(
                            card.cta!.first.bgColor.replaceAll('#', '0xFF'))),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              card.cta!.first.isCircular ? 24 : 8),
                        ),
                      ),
                      child: Text(card.cta!.first.text),
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
              color: Color(int.parse(
                  card.bgColor?.replaceAll('#', '0xFF') ?? '0xFFFFFFFF')),
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

class HC9Widget extends StatelessWidget {
  final HcGroup group;

  const HC9Widget({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      height: group.height?.toDouble() ?? 195,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        itemCount: group.cards.length,
        itemBuilder: (context, index) {
          final card = group.cards[index];
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: card.bgGradient?.colors
                        .map((c) => Color(int.parse(c.replaceAll('#', '0xFF'))))
                        .toList() ??
                    [Colors.transparent],
                transform: GradientRotation(
                    (card.bgGradient?.angle ?? 0) * 3.14 / 180),
              ),
            ),
          );
        },
      ),
    );
  }
}

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
              color: Color(int.parse(
                  card.bgColor?.replaceAll('#', '0xFF') ?? '0xFFFFFFFF')),
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
