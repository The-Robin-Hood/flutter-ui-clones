import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerLayout extends StatefulWidget {
  const DrawerLayout({Key? key}) : super(key: key);

  @override
  _DrawerLayoutState createState() => _DrawerLayoutState();
}

class _DrawerLayoutState extends State<DrawerLayout> {
  List imagesDrawer = [
    'international.png',
    'national.png',
    'politics.png',
    'state.png',
    'business.png',
    'sports.png',
    'entertainment.png',
    'buzz.png',
    'science.png',
    'technology.png',
    'automobile.png',
    'education.png'
  ];
  List labelName = [
    'International',
    'National',
    'Politics',
    'State',
    'Business',
    'Sports',
    'Entertainment',
    'Buzz',
    'Science',
    'Technology',
    'Automobile',
    'Education'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2.15,
                height: 70,
                decoration: BoxDecoration(
                    color: Color(0xFF3EAEC6),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.chartLine,
                        size: 25,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "TOP 10",
                        style: GoogleFonts.roboto(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 2.15,
                height: 70,
                decoration: BoxDecoration(
                    color: Color(0xFF3EAEC6),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Wrap(
                    children: [
                      Icon(
                        FontAwesomeIcons.fire,
                        size: 25,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "TRENDING",
                        style: GoogleFonts.roboto(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 150 / 210,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 3),
                shrinkWrap: true,
                itemCount: labelName.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 55,
                          width: 100,
                          image: AssetImage(
                            "images/${imagesDrawer[index]}",
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${labelName[index]}",
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.settings, color: Colors.white),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bookmarks",
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.bookmark, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
