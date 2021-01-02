import 'package:flutter/material.dart';
import 'package:haberApp/models/data/article.dart';
import 'package:haberApp/models/haber.dart';
import 'package:haberApp/utils/homepage%20tool/PopupMenu.dart';
import 'package:haberApp/utils/homepage%20tool/mytitle.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PopupMenuOptions myPopUp = new PopupMenuOptions();

  List<Article> article = [];

  @override
  void initState() {
    HaberService.getNews().then((value) {
      setState(() {
        article = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: mytitle(),
        actions: [
          myPopUp,
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: article.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.network(article[index].urlToImage),
                  ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text(article[index].title),
                    subtitle: Text(article[index].author),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(article[index].description),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                          onPressed: () async {
                            await launch(article[index].url);
                          },
                          child: Text('Habere Git')),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
