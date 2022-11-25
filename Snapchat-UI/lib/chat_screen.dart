// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapchat/list_chats.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 8, 13, 17),
          child: Row(
            children: [
              CircleAvatar(
                maxRadius: 23,
                backgroundColor: Colors.grey[200],
                child: Image.network(
                  "https://i.postimg.cc/bwryzXvc/oie-0a-SFwlygpk0-M.png",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                maxRadius: 23,
                backgroundColor: Colors.grey[200],
                child: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.grey[700],
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  "Chat",
                  style: GoogleFonts.ubuntu(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
              CircleAvatar(
                  maxRadius: 23,
                  backgroundColor: Colors.grey[200],
                  child: FaIcon(
                    FontAwesomeIcons.userPlus,
                    size: 20,
                    color: Colors.blueGrey,
                  )),
              SizedBox(
                width: 7,
              ),
              CircleAvatar(
                maxRadius: 23,
                backgroundColor: Colors.grey[200],
                child: FaIcon(
                  FontAwesomeIcons.ellipsisH,
                  color: Colors.grey[700],
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: chats,
          ),
        )
      ],
    );
  }
}

class Chats extends StatefulWidget {
  final String? name, streaks, time, imglink;
  final bool? snap;
  const Chats({
    Key? key,
    this.imglink,
    this.snap,
    this.time,
    this.name,
    this.streaks,
  }) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Stack(
        children: [
          CircleAvatar(
            maxRadius: 27,
            backgroundColor: Colors.grey[200],
            child: Image.network(
              widget.imglink == null
                  ? "https://ericsonn.com/resources/bitmoji.png"
                  : widget.imglink!,
            ),
          ),
          Positioned(
            top: 5.0,
            left: 70.0,
            child: Text(
              widget.name.toString(),
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 17),
            ),
          ),
          Positioned(
            left: 70.0,
            bottom: 9.0,
            child: Row(
              children: [
                Icon(
                  (widget.snap!)
                      ? FontAwesomeIcons.solidSquare
                      : FontAwesomeIcons.square,
                  color: (widget.snap!) ? Colors.purple[400] : Colors.red[400],
                  size: 13,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  (widget.snap!) ? "New Snap" : "Received",
                  style: GoogleFonts.lato(
                      color: (widget.snap!)
                          ? Colors.purple[400]
                          : Colors.grey[400],
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.time.toString(),
                  style: GoogleFonts.roboto(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w700,
                      fontSize: 11),
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.circle,
                  size: 5,
                  color: Colors.grey[300],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  (widget.streaks != "")
                      ? widget.streaks.toString() + "🔥"
                      : "",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 11),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 15,
            child: Image.network(
              "https://support-tools.storage.googleapis.com/Greychat_icon-712339909.png",
              scale: 2.5,
            ),
          )
        ],
      ),
    );
  }
}
