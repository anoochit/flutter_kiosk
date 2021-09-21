import 'package:flutter/material.dart';

class OrderTypeWidget extends StatelessWidget {
  const OrderTypeWidget({Key? key, required this.title, this.style}) : super(key: key);

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    String titleValue = "Eat In";
    if (title == "takeout") {
      titleValue = "Take Out";
    }
    return Text(
      titleValue,
      style: style,
    );
  }
}
