import 'package:device_preview/plugins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:hotstar_ui/Config.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      plugins: [
        const ScreenshotPlugin(),
        const FileExplorerPlugin(),
        const SharedPreferencesExplorerPlugin(),
      ],
      builder: (context) => Hotstar(),
    ),
  );
}

class Hotstar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black12,
        drawer: new Drawer(
          elevation: 10,
          child: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          child: Icon(
                            Icons.account_circle,
                            size: 35,
                          )),
                      Text(
                        "Log in \nFor better Experience",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5, top: 15),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Icon(Icons.menu, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage("images/logo.png"),
                        width: 125,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.only(top: 13),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Row(
                                children: [
                                  Text(
                                    "SUBSCRIBE",
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                  )
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        width: 45,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white30,
                  indent: 25,
                  endIndent: 25,
                ),
                Container(
                  height: 200,
                  child: Swiper(
                    autoplay: true,
                    itemCount: Poster.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500/${Poster[Shows[index]]}"),
                              fit: BoxFit.fill),
                        ),
                        margin: EdgeInsets.only(right: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child: Text(
                                Shows[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Text(
                                "${index + 1}/5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "  Latest & Trending",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${trending[index]}"),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "  Recommended for you",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: recommended.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${recommended[index]}"),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "  Popular Shows",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: popularShows.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${popularShows[index]}"),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "  Popular Movies",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: popularMovies.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500/${popularMovies[index]}"),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          currentIndex: 0,
          iconSize: 15,
          // selectedFontSize: 10,
          // unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: "TV"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_cricket), label: "Sports"),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "News"),
          ],
        ),
      ),
    );
  }
}
