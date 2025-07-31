import 'package:flutter/material.dart';

class Toats extends StatelessWidget {
  const Toats({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'To',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset(
              'assets/images/intro_screen_images/sound_image.png',
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
            const Text(
              'ts',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          top: -35,
          right: 115,
          child: Image.asset(
            'assets/images/intro_screen_images/chat_image.png',
            width: 60,
          ),
        ),
      ],
    );
  }
}
