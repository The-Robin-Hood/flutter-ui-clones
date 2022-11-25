import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kokru_ui/News.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  _NewsLayoutState createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  int noOfArticles = 1;
  var articles;
  String category = 'HeadLines';

  getNews() async {
    //Enter API KEY from NEWSAPI
    var url =
        Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=');
    var response = await http.get(url);
    Map results = json.decode(response.body);
    setState(() {
      noOfArticles = results['totalResults'];
      articles = results['articles'];
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: noOfArticles,
          itemBuilder: (context, index) {
            return articles == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    child: Stack(
                      children: [
                        Hero(
                          tag: index,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.7,
                            foregroundDecoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      articles[index]['urlToImage']),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 170,
                          child: Icon(
                            Icons.bookmark_outline,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 115,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Article(articles[index], index),
                                )),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: Text(
                                (articles[index]['title']).split(' - ')[0],
                                style: GoogleFonts.crimsonPro(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 100,
                          child: Text(
                            "Source: " + articles[index]['source']['name'],
                            style: GoogleFonts.crimsonPro(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 80,
                          child: Text(
                            "Posted at: " +
                                DateFormat.yMMMd().format(DateTime.parse(
                                    articles[index]['publishedAt'])),
                            style: GoogleFonts.crimsonPro(
                                fontSize: 10,
                                color: Colors.white30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 180,
                          child: Container(
                            height: 25,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.lightBlue),
                            child: Center(
                              child: Text(
                                category,
                                style: GoogleFonts.roboto(
                                    fontSize: 19,
                                    letterSpacing: 0.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              height: 50,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.reply,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "SHARE",
                                          style: GoogleFonts.crimsonPro(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_down_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  );
          }),
    );
  }
}
