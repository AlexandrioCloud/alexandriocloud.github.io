import 'package:diagonal/diagonal.dart';
import 'package:flutter/material.dart';
import 'package:landing_page/RegisterForm.dart';

import 'KeyPoints.dart';
import 'Logo.dart';
import 'Tagline.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 126, 85, 199),
            Color.fromARGB(255, 224, 139, 146),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
        ],
      ),
    );
  }
}

class MiddlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32.0,
              ),
              child: Tagline(),
            ),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}

class BottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color.fromARGB(0, 126, 85, 199),
      //       Color.fromARGB(0, 224, 139, 146),
      //     ],
      //   ),
      // ),
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: KeyPoints(),
      ),
    );
  }
}

class LeftPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       Color.fromARGB(255, 94, 184, 255),
      //       Color.fromARGB(255, 2, 136, 209),
      //     ],
      //   ),
      // ),
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Logo(),
            SizedBox.fromSize(size: Size.fromHeight(48.0)),
            Tagline(),
            SizedBox.fromSize(size: Size.fromHeight(48.0)),
            KeyPoints(),
          ],
        ),
      ),
    );
  }
}

class RightPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.imgur.com/nzxBbXG.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(64.0, 0);
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: LeftPane(),
          flex: 10,
        ),
        Expanded(
          child: RightPane(),
          flex: 8,
        ),
      ],
    );
    // return Column(
    //   children: <Widget>[
    //     TopPage(),
    //     MiddlePage(),
    //     BottomPage(),
    //   ],
    // );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color.fromARGB(255, 126, 85, 199),
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: Container(
          child: SafeArea(
            child: SizedBox.expand(
              // child: SingleChildScrollView(
              child: Container(
                child: MainScreen(),
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(App());
}
