import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text(
        "Votre bibliothèque privée, synchronisée, partout.",
        style: Theme.of(context).textTheme.headline4,
        textAlign: TextAlign.center,
      );
}
