import 'package:flutter/material.dart';

import 'App.dart';

class KeyPoint extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const KeyPoint({
    Key key,
    @required this.title,
    @required this.description,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settings = context.findAncestorStateOfType<AppState>().settings;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          size: 48,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: settings.color,
              ),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }
}

class KeyPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          KeyPoint(
            description: "Retrouver vos livres sur tout vos appareils.",
            icon: Icons.cloud,
            title: "Bibliothèque dans le cloud",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          KeyPoint(
            description:
                "Mettez en ligne vos livres et récupérez les à tout moment sur n'importe quel plateforme.",
            icon: Icons.file_upload,
            title: "Votre bibliothèque vous appartient",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          KeyPoint(
            description: "Prenez des notes à tout moment sur chaque page.",
            icon: Icons.edit,
            title: "Prise de notes",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          KeyPoint(
            description: "Transparence et respect de la vie privée.",
            icon: Icons.share,
            title: "Open Source",
          ),
        ],
      );
}
