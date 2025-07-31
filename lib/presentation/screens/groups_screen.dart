import 'package:flutter/material.dart';
import 'dart:math';

class GroupsScreen extends StatelessWidget {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/groups_screen_images/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildHeader(),
                  SizedBox(height: 20),
                  _buildGroupsButton(),
                  SizedBox(height: 30),
                  Expanded(child: _buildGroupsList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 2,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 3),
              ),
              Container(
                width: 20,
                height: 2,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 3),
              ),
              Container(width: 20, height: 2, color: Colors.white),
            ],
          ),
          Spacer(),
          Icon(Icons.volume_off, color: Colors.white, size: 24),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(Icons.check, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupsButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      width: 175,
      height: 47,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFED36A),
        borderRadius: BorderRadius.circular(23.5),
      ),
      child: Text(
        'Groups',
        style: TextStyle(
          color: Color(0xFF106967),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGroupsList() {
    final groups = [
      GroupItem(
        'Android Developer',
        'assets/images/groups_screen_images/andrioddeveloper.png',
        isRead: false,
      ),
      GroupItem(
        'IOS Developer',
        'assets/images/groups_screen_images/iosdeveloper.png',
        isRead: false,
      ),
      GroupItem(
        'Web Developer',
        'assets/images/groups_screen_images/webdeveloper.png',
        isRead: false,
      ),
      GroupItem(
        'Back-End Team',
        'assets/images/groups_screen_images/backendteam.png',
        isRead: false,
      ),
      GroupItem(
        'Front-End Team',
        'assets/images/groups_screen_images/frontendteam.png',
        isRead: false,
      ),
      GroupItem(
        'Android Developer',
        'assets/images/groups_screen_images/androiddeveloper2.png',
        isRead: false,
      ),
      GroupItem(
        'Personal Project',
        'assets/images/groups_screen_images/personalproject.png',
        isRead: false,
      ),
      GroupItem(
        'School System Project',
        'assets/images/groups_screen_images/schoolsystemproject.png',
        isRead: false,
      ),
    ];

    int readIndex1 = random.nextInt(groups.length);
    int readIndex2;
    do {
      readIndex2 = random.nextInt(groups.length);
    } while (readIndex2 == readIndex1);

    groups[readIndex1].isRead = true;
    groups[readIndex2].isRead = true;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _buildGroupItem(groups[index]),
          );
        },
      ),
    );
  }

  Widget _buildGroupItem(GroupItem group) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            group.avatarPath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.done_all,
                    color: group.isRead ? Color(0xFFFFD93D) : Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.mic,
                    color: group.isRead ? Color(0xFFFFD93D) : Colors.grey,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '0:03',
                    style: TextStyle(
                      color: group.isRead ? Color(0xFFFFD93D) : Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          '15:35',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
        ),
      ],
    );
  }
}

class GroupItem {
  final String name;
  final String avatarPath;
  bool isRead;

  GroupItem(this.name, this.avatarPath, {this.isRead = false});
}
