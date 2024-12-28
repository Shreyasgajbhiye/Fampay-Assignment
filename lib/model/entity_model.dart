class Entity {
  final String text;
  final String type;
  final String color;
  final int fontSize;
  final String fontStyle;
  final String fontFamily;

  Entity({
    required this.text,
    required this.type,
    required this.color,
    required this.fontSize,
    required this.fontStyle,
    required this.fontFamily,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      text: json['text'] ?? '',
      type: json['type'] ?? 'generic_text',
      color: json['color'] ?? '#000000',
      fontSize: json['font_size'] ?? 14,
      fontStyle: json['font_style'] ?? 'normal',
      fontFamily: json['font_family'] ?? 'met_regular',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'type': type,
      'color': color,
      'font_size': fontSize,
      'font_style': fontStyle,
      'font_family': fontFamily,
    };
  }
}