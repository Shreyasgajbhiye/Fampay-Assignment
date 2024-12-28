import 'package:fampay_assignment/model/bg_image_model.dart';
import 'package:fampay_assignment/model/formatted_description_model.dart';
import 'package:fampay_assignment/model/formatted_title_model.dart';

class CardDetails {
  final int id;
  final String name;
  final String slug;
  final String title;
  final FormattedTitle formattedTitle;
  final String description;
  final FormattedDescription formattedDescription;
  final String icon;
  final String url;
  final BgImage bgImage;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;

  CardDetails({
    required this.id,
    required this.name,
    required this.slug,
    required this.title,
    required this.formattedTitle,
    required this.description,
    required this.formattedDescription,
    required this.icon,
    required this.url,
    required this.bgImage,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) {
    return CardDetails(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      title: json['title'] ?? '',
      formattedTitle: FormattedTitle.fromJson(json['formatted_title']),
      description: json['description'] ?? '',
      formattedDescription: FormattedDescription.fromJson(json['formatted_description']),
      icon: json['icon']['image_url'],
      url: json['url'] ?? '',
      bgImage: BgImage.fromJson(json['bg_image']),
      isDisabled: json['is_disabled'],
      isShareable: json['is_shareable'],
      isInternal: json['is_internal'],
    );
  }
}
