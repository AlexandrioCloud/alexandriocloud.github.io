import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return SvgPicture.asset(
    //   "assets/logo.svg",
    //   semanticsLabel: 'Acme Logo',
    //   width: 350,
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://i.imgur.com/okPRaUc.png",
          width: 100,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "Alexandrio",
            style: TextStyle(
              fontSize: 48.0,
            ),
          ),
        ),
      ],
    );
  }
}
