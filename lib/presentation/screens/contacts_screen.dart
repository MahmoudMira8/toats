import 'package:flutter/material.dart';
import 'dart:math';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<ContactModel> pinnedContacts = [
    ContactModel(
      name: 'Sara',
      avatar: 'assets/images/contacts_screen_images/sara.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sally',
      avatar: 'assets/images/contacts_screen_images/sally.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Ahmed',
      avatar: 'assets/images/contacts_screen_images/ahmed.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'salma',
      avatar: 'assets/images/contacts_screen_images/salma.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sophia',
      avatar: 'assets/images/contacts_screen_images/sophia.png',
      isOnline: true,
    ),
  ];

  final List<ContactModel> allContacts = [
    ContactModel(
      name: 'Sara',
      avatar: 'assets/images/contacts_screen_images/sara.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sally',
      avatar: 'assets/images/contacts_screen_images/sally.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Ahmed',
      avatar: 'assets/images/contacts_screen_images/ahmed.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'salma',
      avatar: 'assets/images/contacts_screen_images/salma.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sophia',
      avatar: 'assets/images/contacts_screen_images/sophia.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sara',
      avatar: 'assets/images/contacts_screen_images/sara.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sally',
      avatar: 'assets/images/contacts_screen_images/sally.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Ahmed',
      avatar: 'assets/images/contacts_screen_images/ahmed.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'salma',
      avatar: 'assets/images/contacts_screen_images/salma.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sophia',
      avatar: 'assets/images/contacts_screen_images/sophia.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sara',
      avatar: 'assets/images/contacts_screen_images/sara.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sally',
      avatar: 'assets/images/contacts_screen_images/sally.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Ahmed',
      avatar: 'assets/images/contacts_screen_images/ahmed.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'salma',
      avatar: 'assets/images/contacts_screen_images/salma.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sophia',
      avatar: 'assets/images/contacts_screen_images/sophia.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sara',
      avatar: 'assets/images/contacts_screen_images/sara.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sally',
      avatar: 'assets/images/contacts_screen_images/sally.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Ahmed',
      avatar: 'assets/images/contacts_screen_images/ahmed.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'salma',
      avatar: 'assets/images/contacts_screen_images/salma.png',
      isOnline: true,
    ),
    ContactModel(
      name: 'Sophia',
      avatar: 'assets/images/contacts_screen_images/sophia.png',
      isOnline: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/contacts_screen_images/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          Column(
            children: [
              SafeArea(child: _buildAppBar()),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      _buildPinnedSection(),
                      _buildSearchBar(),
                      const SizedBox(height: 20),
                      _buildContactsSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(Icons.menu, color: Colors.white, size: 24),
          Spacer(),
          Icon(Icons.volume_up_outlined, color: Colors.white, size: 24),
          SizedBox(width: 16),
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

  Widget _buildPinnedSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF106967),
                ),
              ),
              Transform.rotate(
                angle: pi / 4, 
                child: Icon(Icons.push_pin, color: Color(0xFF106967), size: 25),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: pinnedContacts
                .map((contact) => _buildContactAvatar(context, contact))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0x99E0E0E0),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 87, 89, 91),
            fontSize: 16,
          ),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Color(0xFF66686B), size: 25),
        ),
      ),
    );
  }

  List<ContactModel> _filterContacts(String query) {
    return allContacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  Widget _buildContactsSection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF106967),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.group_add,
                    color: Color(0xFF4CAF93),
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Expanded(
              child: ValueListenableBuilder<TextEditingValue>(
                valueListenable: _searchController,
                builder: (context, value, child) {
                  final filteredContacts = _filterContacts(value.text);
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: _buildContactAvatar(
                          context,
                          filteredContacts[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildContactAvatar(BuildContext context, ContactModel contact) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected ${contact.name}'),
          duration: Duration(seconds: 1),
        ),
      );


    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(contact.avatar),
              backgroundColor: Colors.grey[300],
            ),
            Positioned(
              bottom: 2,
              right: 0,
              child: Image.asset(
                'assets/images/contacts_screen_images/mic.png',
                width: 14.37,
                height: 19.89,
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Text(
          contact.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF163235),
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

class ContactModel {
  final String name;
  final String avatar;
  final bool isOnline;

  ContactModel({
    required this.name,
    required this.avatar,
    this.isOnline = false,
  });
}
