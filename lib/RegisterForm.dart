import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'App.dart';

class RegisterForm extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var settings = context.findAncestorStateOfType<AppState>().settings;
    
    return Theme(
      data: ThemeData.dark().copyWith(
        primaryColor: settings.color,
        accentColor: settings.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              filled: true,
              // fillColor: Colors.white.withAlpha(100),
              labelText: "Adresse Email",
            ),
          ),
          FlatButton(
            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();
              var list = prefs.getStringList("NewsletterMails");
              if (list == null) list = List<String>();
              list.add(controller.text);
              await prefs.setStringList("NewsletterMails", list);

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
      ),
    );
  }
}
