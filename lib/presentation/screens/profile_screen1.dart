import 'package:flutter/material.dart';

const Color kPrimaryBackgroundColor = Color(0xFF3AAFA9); 
const Color kCardBackgroundColor = Color(0xFF2B4146); 
const Color kTextColor = Colors.white;
const Color kAvatarBackgroundColor = Color(0xFFFFC0CB); 

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Screen',
      theme: ThemeData(
        fontFamily: 'Sans-serif', 
        primaryColor: Color(0xFF4FBC9C),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF163235),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                backgroundColor: Color(0xFF4FBC9C),
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 100.0,
                  ),
                  centerTitle: false,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                ),
              ),
            ],
          ),
         
          Positioned(
            top: 190, 
            left: 32,
            right: 32,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF163235),
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  _buildUserInfo(),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.white24,
                    indent: 16,
                    endIndent: 16,
                  ),
                  // قسم الإعدادات
                  _buildSettingsSection(),
                  const Divider(
                    color: Colors.white24,
                    indent: 16,
                    endIndent: 16,
                  ),
                  _buildMoreSection(),
                  const SizedBox(height: 500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: kAvatarBackgroundColor,
            child: Text(
              '👩‍🎨',
              style: TextStyle(fontSize: 30),
            ), 
          ),
          SizedBox(width: 16),
          Text(
            'Olivia Anna',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      children: [
        _buildListTile(
          title: 'Change Name',
          onTap: () {
           
          },
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        _buildListTile(
          title: 'Change Number',
          onTap: () {
            
          },
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 18,
          ),
        ),
        _buildListTile(
          title: 'Notifications',
          trailing: Switch(
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            activeTrackColor: Color(0xFF4FBC9C).withOpacity(0.7),
            activeColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildListTile(
            title: 'About us',
            onTap: () {
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: kTextColor, fontSize: 17),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
