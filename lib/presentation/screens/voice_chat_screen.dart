import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VoiceChatScreen extends StatefulWidget {
  @override
  _VoiceChatScreenState createState() => _VoiceChatScreenState();
}

class _VoiceChatScreenState extends State<VoiceChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildChatBody(),
      floatingActionButton: _buildMicButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),

              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/contacts_screen_images/ahmed.png',
                ),
              ),

              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Olivia Anna',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4ECDC4), Color(0xFF44A08D)],
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 35),
            _buildVoiceMessage(isMe: false, duration: "0:23", time: "2:48 PM"),
            SizedBox(height: 20),
            _buildVoiceMessage(isMe: true, duration: "0:12", time: "2:48 PM"),
            SizedBox(height: 20),
            _buildVoiceMessage(isMe: false, duration: "0:34", time: "2:48 PM"),
            SizedBox(height: 20),
            _buildVoiceMessage(isMe: true, duration: "0:08", time: "2:48 PM"),
            SizedBox(height: 20),
            _buildVoiceMessage(isMe: false, duration: "0:45", time: "2:48 PM"),
            SizedBox(height: 20),
            _buildVoiceMessage(isMe: true, duration: "0:19", time: "2:48 PM"),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      height: 15,
      color: Colors.white,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Container(height: 0),
    );
  }

  Widget _buildMicButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF2C3E50),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Icon(Icons.mic, color: Colors.white, size: 28),
    );
  }

  Widget _buildVoiceMessage({
    required bool isMe,
    required String duration,
    required String time,
  }) {
    final avatarColor = isMe ? Colors.indigo.shade400 : Colors.brown.shade400;

    // --- WIDGETS DEFINITION ---

    // 1. Avatar
    Widget avatarWidget = CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(
        isMe
            ? 'assets/images/contacts_screen_images/sara.png'
            : 'assets/images/contacts_screen_images/ahmed.png',
      ),
    );

    // 2. Play Icon
    Widget playIconWidget = Icon(
      Icons.play_arrow,
      color: Colors.white,
      size: 24,
    );
    if (isMe) {
      playIconWidget = Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(3.1416), // Flip for sent messages
        child: playIconWidget,
      );
    }

    // 3. Dots Waveform
    Widget dotsWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(40, (index) {
        return Container(
          width: 2.5,
          height: 2.5,
          margin: EdgeInsets.symmetric(horizontal: 1.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
        );
      }),
    );

    // --- ASSEMBLY ---

    // This is the main content inside the bubble, excluding the avatar
    Widget mainContent = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Contains the horizontally-aligned play icon and dots
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // This is the key alignment
            children: isMe
                ? [
                    Spacer(),
                    dotsWidget,
                    SizedBox(width: 8),
                    playIconWidget,
                  ] // Sent order
                : [
                    playIconWidget,
                    SizedBox(width: 8),
                    dotsWidget,
                    Spacer(),
                  ], // Received order
          ),
          SizedBox(height: 3),
          // Row 2: Contains the time and duration
          Padding(
            padding: EdgeInsets.only(left: isMe ? 0 : 32, right: isMe ? 32 : 0),
            child: Row(
              children: [
                Text(
                  isMe ? duration : time,
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Spacer(),
                Text(
                  isMe ? time : duration,
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // This is the final bubble container
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isMe ? Color(0xFF106967) : Color(0xFF163235),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: isMe
                  ? [
                      mainContent,
                      SizedBox(width: 8),
                      avatarWidget,
                    ] // Sent layout
                  : [
                      avatarWidget,
                      SizedBox(width: 8),
                      mainContent,
                    ], // Received layout
            ),
          ),
        ),
      ],
    );
  }
}
