class CTA {
  final String text;
  final String type;
  final String bgColor;
  final bool isCircular;
  final bool isSecondary;
  final int strokeWidth;

  CTA({
    required this.text,
    required this.type,
    required this.bgColor,
    required this.isCircular,
    required this.isSecondary,
    required this.strokeWidth,
  });

  factory CTA.fromJson(Map<String, dynamic> json) {
    return CTA(
      text: json['text'] ?? '',
      type: json['type'] ?? 'normal',
      bgColor: json['bg_color'] ?? '#000000',
      isCircular: json['is_circular'] ?? false,
      isSecondary: json['is_secondary'] ?? false,
      strokeWidth: json['stroke_width'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'type': type,
      'bg_color': bgColor,
      'is_circular': isCircular,
      'is_secondary': isSecondary,
      'stroke_width': strokeWidth,
    };
  }
}