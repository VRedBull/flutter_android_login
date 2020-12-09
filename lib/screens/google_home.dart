import 'package:flutter/material.dart';
import 'package:flutter_login_android/screens/login.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHome extends StatefulWidget {
  @override
  _GoogleHomeState createState() => _GoogleHomeState();
}

class _GoogleHomeState extends State<GoogleHome> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Vikas',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(radius: 70, backgroundImage: NetworkImage('')),
        SizedBox(
          height: 20,
        ),
        Text(
          'pradhanvikas11@gmail.com',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 100,
        ),
        SignInButton(
          Buttons.Google,
          text: 'Sign out of Google',
          onPressed: () {
            _googleSignIn.signOut().then((user) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login())));
          },
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        )
      ],
    )));
  }
}
