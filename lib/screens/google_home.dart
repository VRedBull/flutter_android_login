import 'package:flutter/material.dart';
import 'package:flutter_login_android/paint/background_painter.dart';
import 'package:flutter_login_android/screens/login.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHome extends StatefulWidget {
  @override
  _GoogleHomeState createState() => _GoogleHomeState();
}

class _GoogleHomeState extends State<GoogleHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
      child: CustomPaint(
        painter: BackgroundPainter(
          animation: _controller.view,
        ),
        child: Center(
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
            Hero(
              tag: 'GoogleButton',
              child: SignInButton(
                Buttons.Google,
                text: 'Sign out of Google',
                onPressed: () {
                  _googleSignIn
                      .signOut()
                      .then((user) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login())));
                  _controller.forward(from: 0);
                },
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
