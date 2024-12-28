class FormattedText {
  final String text;
  final String type;
  final String color;
  final String fontStyle;
  final String fontFamily;

  FormattedText({
    required this.text,
    required this.type,
    required this.color,
    required this.fontStyle,
    required this.fontFamily,
  });

  factory FormattedText.fromJson(Map<String, dynamic> json) {
    return FormattedText(
      text: json['text'],
      type: json['type'],
      color: json['color'],
      fontStyle: json['font_style'],
      fontFamily: json['font_family'],
    );
  }
}
