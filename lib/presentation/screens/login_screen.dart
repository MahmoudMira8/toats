import 'package:flutter/material.dart';
import 'package:message_app_training/constans/my-colors.dart';
import 'package:message_app_training/presentation/widgets/login_button.dart';
import 'package:message_app_training/presentation/widgets/text_filed_widget.dart';
import 'package:message_app_training/presentation/widgets/toats.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_screen_images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: Toats()),
                const SizedBox(height: 60),
                const Text(
                  'Phone number',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    color: MyColors.deepTeal,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    letterSpacing: 0.0,
                  ),
                ),
                const SizedBox(height: 10),
                TextFiledWidget(),
                const SizedBox(height: 160),
                LoginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
