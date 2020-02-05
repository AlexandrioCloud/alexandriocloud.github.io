import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            filled: true,
            // fillColor: Colors.white.withAlpha(100),
            labelText: "Adresse Email",
          ),
        ),
        FlatButton(
          onPressed: () {
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                  'Your email has been successfully registered to our newsletter!'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Text(
            "M'inscrire à la newsletter",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
