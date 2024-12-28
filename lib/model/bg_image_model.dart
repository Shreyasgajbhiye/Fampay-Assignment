class BgImage {
  final String imageType;
  final String imageUrl;
  final double aspectRatio;

  BgImage({
    required this.imageType,
    required this.imageUrl,
    required this.aspectRatio,
  });

  factory BgImage.fromJson(Map<String, dynamic> json) {
    return BgImage(
      imageType: json['image_type'],
      imageUrl: json['image_url'],
      aspectRatio: json['aspect_ratio']?.toDouble() ?? 1.0,
    );
  }
}