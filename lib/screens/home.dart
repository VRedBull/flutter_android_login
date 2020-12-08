import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_android/blocs/auth_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  StreamSubscription<User> homeStateSubscription;

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    homeStateSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    homeStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data.displayName,
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(radius: 70, backgroundImage: NetworkImage(snapshot.data.photoURL + '?width=500&500')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    snapshot.data.email,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    text: 'Sign out of Facebook',
                    onPressed: () {
                      authBloc.logout();
                    },
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  )
                ],
              );
            }),
      ),
    );
  }
}
