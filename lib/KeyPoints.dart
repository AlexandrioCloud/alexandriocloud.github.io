import 'package:flutter/material.dart';

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
    return Wrap(
      direction: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: Icon(
            icon,
            size: 48,
          ),
        ),
        Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(description),
          ],
        ),
      ],
    );
  }
}

class KeyPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
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
}
