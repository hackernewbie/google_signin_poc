// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const GoogleSignInPOC());
}

class GoogleSignInPOC extends StatefulWidget {
  const GoogleSignInPOC({Key? key}) : super(key: key);

  @override
  State<GoogleSignInPOC> createState() => _GoogleSignInPOCState();
}

class _GoogleSignInPOCState extends State<GoogleSignInPOC> {
  GoogleSignIn _googleSignInObj  = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? thisUser  = _googleSignInObj.currentUser;

    print(thisUser == null ? thisUser : thisUser.displayName);

    return MaterialApp(
      //theme: ThemeData(colorScheme: Colors.black),
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Google SignIn POC - ' + (thisUser == null ? ' You are not Logged In' : ' Hello ' + thisUser.displayName.toString())),
        ),
        body: Center(
          child: Column(children: [
            thisUser == null ?
              ElevatedButton(
                onPressed: () async {
                  await _googleSignInObj.signIn();
                  setState(() {});
                },
                child: Text('Sign In'),
              )
              :
              ElevatedButton(
                onPressed: () async {
                  await _googleSignInObj.signOut();
                  setState(() {});
                },
                child: Text('Sign Out')),
            ],)
          ),
      ),
    );
  }
}

