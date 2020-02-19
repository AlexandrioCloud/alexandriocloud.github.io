import 'package:flutter/material.dart';
import 'package:landing_page/App.dart';
import 'package:landing_page/KeyPoints.dart';
import 'package:landing_page/Logo.dart';
import 'package:landing_page/Tagline.dart';

import '../RegisterForm.dart';

class VerticalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(128.0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HorizontalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.0, 32.0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height - 32.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class VerticalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Logo(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Tagline(),
            ),
            ClipPath(
              clipper: HorizontalClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/25MD6ey.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(42.0),
                  child: RegisterForm(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: KeyPoints(),
            ),
          ],
        ),
      );
}

class HorizontalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Logo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Tagline(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: KeyPoints(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ClipPath(
              clipper: VerticalClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/25MD6ey.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 42.0 + 64.0,
                    right: 42.0,
                    top: 42.0,
                    bottom: 42.0,
                  ),
                  child: RegisterForm(),
                ),
              ),
            ),
          ),
        ],
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = context.findAncestorStateOfType<AppState>();
    var settings = state.settings;
    var mediaQuery = MediaQuery.of(context);
    var ratio = mediaQuery.size.width / mediaQuery.size.height;
    bool horizontal = ratio > 1.0;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state.setState(() {
            settings.darkTheme = !settings.darkTheme;
          });
        },
        child: Icon(Icons.lightbulb_outline),
      ),
      body: SafeArea(
        child: horizontal ? HorizontalDetails() : VerticalDetails(),
      ),
    );
  }
}
