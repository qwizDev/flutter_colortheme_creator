import 'package:flutter/material.dart';

class ExampleButtonPlusDescription extends StatelessWidget {
  const ExampleButtonPlusDescription({
    super.key,
    required this.nameOfTextCol,
    required this.nameOfBackgroundCol,
    required this.foregroundCol,
    required this.backgroundCol,
  });

  final String nameOfTextCol;
  final String nameOfBackgroundCol;
  final Color foregroundCol;
  final Color? backgroundCol;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("foreground: $nameOfTextCol"),
        Text("background: $nameOfBackgroundCol"),
        ExampleButton(
          caption: "ExampleButton",
          foregroundCol: foregroundCol,
          backgroundCol: backgroundCol,
        ),
      ],
    );
  }
}

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.caption,
    required this.foregroundCol,
    required this.backgroundCol,
  });

  final String caption;
  final Color foregroundCol;
  final Color? backgroundCol;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundCol),
      ),
      child: Text(
        caption,
        style: TextStyle(
          color: foregroundCol,
          // backgroundColor: backgroundCol,
        ),
      ),
    );
  }
}
