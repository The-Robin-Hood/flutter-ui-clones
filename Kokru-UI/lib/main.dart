import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kokru_ui/NewsPage.dart';

import 'DrawerLayoutPage.dart';

void main() {
  runApp(Kokru());
}

class Kokru extends StatelessWidget {
  const Kokru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final PageController _pageController = PageController(initialPage: 1);
  int mainPageSwitch = 1;
  bool Loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  mainPageSwitch == 1
                      ? IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            print(_pageController.page);
                            _pageController.animateTo(0,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.bounceInOut);
                          },
                          icon: Icon(
                            FontAwesomeIcons.alignLeft,
                            color: Colors.white,
                          ),
                        )
                      : IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            _pageController.animateToPage(1,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.bounceOut);
                          },
                          icon: Icon(
                            FontAwesomeIcons.alignRight,
                            color: Colors.white,
                          ),
                        ),
                  Text(
                    "KOKRU",
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    child: Loading
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 11),
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          )
                        : IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () async {
                              setState(() {
                                Loading = true;
                              });
                              await Future.delayed(Duration(milliseconds: 500));
                              setState(() {
                                Loading = false;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.black87,
                                duration: Duration(milliseconds: 500),
                                content: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "You are reading the latest news",
                                      style: GoogleFonts.crimsonPro(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ));
                            },
                            icon: Icon(
                              FontAwesomeIcons.redo,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                  )
                ],
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    mainPageSwitch = index;
                  });
                },
                children: [
                  Container(
                    child: DrawerLayout(),
                  ),
                  Container(
                    child: NewsLayout(),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
