// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapchat/main.dart';

class Camera extends StatefulWidget {
  List? cameras;
  Camera({Key? key, this.cameras}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController controller =
      CameraController(cameras![0], ResolutionPreset.max);

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          CameraPreview(controller),
          Padding(
            padding: const EdgeInsets.fromLTRB(13, 8, 13, 17),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 23,
                  backgroundColor: Colors.black26,
                  child: Image.network(
                    "https://i.postimg.cc/bwryzXvc/oie-0a-SFwlygpk0-M.png",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  maxRadius: 23,
                  backgroundColor: Colors.black26,
                  child: FaIcon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 165,
                ),
                CircleAvatar(
                    maxRadius: 23,
                    backgroundColor: Colors.black26,
                    child: FaIcon(
                      FontAwesomeIcons.userPlus,
                      size: 20,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 7,
                ),
                CircleAvatar(
                  maxRadius: 23,
                  backgroundColor: Colors.black26,
                  child: FaIcon(
                    FontAwesomeIcons.ellipsisH,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 135,
            bottom: 10,
            child: GestureDetector(
              onTap: () {
                controller.takePicture();
              },
              child: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 120,
              ),
            ),
          ),
          Positioned(
            right: 90,
            bottom: 50,
            child: Icon(
              Icons.circle,
              color: Colors.black12,
              size: 50,
            ),
          ),
          Positioned(
            right: 100,
            bottom: 60,
            child: Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Positioned(
            left: 80,
            bottom: 50,
            child: Icon(
              Icons.circle,
              color: Colors.black12,
              size: 50,
            ),
          ),
          Positioned(
            left: 90,
            bottom: 60,
            child: Icon(
              Icons.collections,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
