import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://i.imgur.com/85UVbyR.png",
      width: 350,
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
    );
  }
}
