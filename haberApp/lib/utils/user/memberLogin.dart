import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:haberApp/utils/homepage%20tool/mytitle.dart';
import 'package:haberApp/utils/user/mywidget/social_login.dart';
import 'package:haberApp/utils/user/emailLogin/email_Login.dart';
import 'package:provider/provider.dart';
import "package:haberApp/utils/user/emailLogin/emailRegister.dart";

class MemberLogin extends StatefulWidget {
  @override
  _MemberLoginState createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  User user;
  /* void _googleIleGiris(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context,listen: false);
    User _user = await _userModel.signInWithGoogle();
    if (_user != null) print("Oturum açan user id:" + _user.userID.toString());
  } */
  void _emailVeSifreGiris(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => RegisterEmailSection(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: mytitle(),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Oturum Açın",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              butonText: "Gmail ile Giriş Yap",
              textColor: Colors.black87,
              butonColor: Colors.white,
              butonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () {},
            ),
            SocialLoginButton(
              onPressed: () => _emailVeSifreGiris(context),
              butonIcon: Icon(
                Icons.email,
                color: Colors.white,
                size: 32,
              ),
              butonText: "Email ve Şifre ile Giriş yap",
            ),
          ],
        ),
      ),
    );
  }
}
