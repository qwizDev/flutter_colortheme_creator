import 'package:flutter/material.dart';

class PanelColDemo extends StatelessWidget {
  const PanelColDemo({
    super.key,
    // required this.colScheme,
    required this.textCol,
    required this.textColName,
    required this.backgroundCol,
    required this.backgroundColName,
  });

  // final ColorScheme colScheme;
  final Color textCol;
  final String textColName;
  final Color backgroundCol;
  final String backgroundColName;

  final String someFillText = "Text to fill the panel";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: backgroundCol, border: Border.all()),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            children: [
              Text(
                "Color: $textColName  ",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  color: textCol,
                ),
              ),
              // Text(someFillText, style: TextStyle(color: textCol)),
              Text(
                "backgroundColor: $backgroundColName",
                style: TextStyle(color: textCol),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
