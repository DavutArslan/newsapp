import "package:flutter/material.dart";
import 'package:haberApp/utils/homepage.dart';
import 'package:haberApp/utils/user/memberLogin.dart';

class PopupMenuOptions extends StatefulWidget {
  @override
  _PopupMenuOptionsState createState() => _PopupMenuOptionsState();
}

class _PopupMenuOptionsState extends State<PopupMenuOptions> {
  @override
  Widget build(BuildContext context) {
    return myPopUpMenu();
  }

  Widget myPopUpMenu() {
    return PopupMenuButton(
      onCanceled: () {},
      color: Colors.white,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 1,
          child: Text('ÜYE GİRİŞİ'),
        ),
        PopupMenuItem(
          value: 2,
          child: Text('HABERLER'),
        ),
        PopupMenuItem(
          value: 3,
          child: Text('HAKKINDA'),
        ),
        PopupMenuItem(
          value: 4,
          child: Text('Çıkış'),
        ),
      ],
      onSelected: (menu) {
        if (menu == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberLogin()));
        } else if (menu == 1) {
        } else if (menu == 3) {
        } else if (menu == 4) {}
      },
    );
  }
}
