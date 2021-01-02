import 'package:flutter/material.dart';
import 'package:haberApp/models/firebase/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haberApp/utils/homepage%20tool/mytitle.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  
  AuthServices authServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: mytitle(),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
//5
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme.of(context).buttonColor,
              onPressed: () async {
                // ignore: deprecated_member_use
                final FirebaseUser user = await _auth.currentUser;
                if (user == null) {
//6
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                await _auth.signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(uid + ' has successfully signed out.'),
                ));
              },
            );
          })
        ],
      ),
      body: Builder(builder: (BuildContext context) {
//7
        return ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            //TODO: UI widgets will go here.
          ],
        );
      }),
    );
  }
}
