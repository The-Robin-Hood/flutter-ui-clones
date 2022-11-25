// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'camera_screen.dart';
import 'chat_screen.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const SnapApp());
}

class SnapApp extends StatelessWidget {
  const SnapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 1);

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          onPageChanged: (pageIndex) {
            setState(() {
              index = pageIndex;
            });
          },
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
            LocationScreen(),
            ChatPage(),
            Camera(
              cameras: cameras,
            ),
            FriendsScreen(),
            PlayScreen()
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue[300],
            unselectedItemColor: Colors.grey[300],
            backgroundColor: Colors.black,
            currentIndex: index,
            onTap: (currentIndex) {
              setState(() {
                index = currentIndex;
                _pageController.animateToPage(currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.location_on_rounded,
                    color: (index == 0) ? Colors.teal : Colors.grey[300],
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.mode_comment_outlined,
                    color: (index == 1) ? Colors.blue : Colors.grey[300],
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    (index == 2) ? Icons.camera : Icons.camera_alt_outlined,
                    color: (index == 2) ? Colors.yellow : Colors.grey[300],
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.people_outline_rounded,
                    color: (index == 3) ? Colors.purple[300] : Colors.grey[300],
                  )),
              BottomNavigationBarItem(
                  label: "",
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: (index == 4) ? Colors.red[500] : Colors.grey[300],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
            "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg",
            scale: 2.5),
      ),
    );
  }
}

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Friends"),
      ),
    );
  }
}

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Play"),
      ),
    );
  }
}
