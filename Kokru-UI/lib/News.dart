import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';

class Article extends StatefulWidget {
  final Map articlesData;
  final int tag;
  Article(this.articlesData, this.tag);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  void initState() {
    super.initState();
    print(widget.articlesData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.tag,
                    child: Image(
                      image: NetworkImage(widget.articlesData['urlToImage']),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Text(
                        (widget.articlesData['title']).split(' - ')[0],
                        style: GoogleFonts.crimsonPro(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: WebviewScaffold(url: widget.articlesData['url']),
              )
            ],
          ),
        ),
      ),
    );
  }
}
