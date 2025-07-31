import 'package:flutter/material.dart';
import 'package:message_app_training/presentation/screens/group_chat_screen.dart';
import 'package:message_app_training/presentation/screens/voice_chat_screen.dart';
import 'package:message_app_training/presentation/screens/groups_screen.dart';
import 'package:message_app_training/presentation/screens/contacts_screen.dart';
import 'package:message_app_training/presentation/screens/intro_screen.dart';
import 'package:message_app_training/presentation/screens/login_screen.dart';
import 'package:message_app_training/presentation/screens/opt_screen.dart';
import 'package:message_app_training/presentation/screens/profile_screen1.dart';
import 'package:message_app_training/models/contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GroupsScreen());
  }
}
