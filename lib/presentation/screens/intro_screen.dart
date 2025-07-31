import 'package:flutter/material.dart';
import 'package:message_app_training/presentation/widgets/toats.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/intro_screen_images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Toats(),

                Transform.translate(
                  offset: const Offset(0, -85),
                  child: Image.asset(
                    'assets/images/intro_screen_images/voice_image.png',
                    height: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
